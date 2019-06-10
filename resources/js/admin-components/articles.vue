<template>
    <div>
        <!-- <router-link to="/profile">profile</router-link> -->
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">title</th>
                    <th scope="col">body</th>
                    <th scope="col">user_id</th>
                    <th scope="col">track_id</th>
                    <th scope="col">Created at</th>
                    <th scope="col">
                        <button type="button" class="btn btn-primary" @click="newModal">
                            Add New Article
                        </button>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="article in articles" :key="article.id">
                    <th scope="row">{{article.id}}</th>
                    <td>{{article.title}}</td>
                    <td>{{article.body.substring(0,90)+"...."}}</td>
                    <td>{{article.user_id}}</td>
                    <td>{{article.track_id}}</td>
                    <td>{{article.created_at | myDate}}</td>
                    <td>
                        <a href="#" @click="editModal(article)" class="text-primary"><i
                                class="fa fa-edit fa-lg c-info"></i></a>
                        &nbsp;&nbsp;
                        <a href="#" @click="deleteArticle(article.id)" class="text-danger"><i
                                class="fa fa-trash fa-lg c-danger"></i></a>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- start modal  -->

        <!-- Modal -->
        <div class="modal fade" id="addarticle" tabindex="-1" role="dialog" aria-labelledby="addprofileTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-show="!editmode" class="modal-title" id="addarticleTitle">Add New Article</h5>
                        <h5 v-show="editmode" class="modal-title" id="addarticleTitle">Update Article Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editmode?updateArticle():creatArticle()">
                        <div class="modal-body">
                            <div class="form-group">
                                <input v-model="form.title" type="text" title="title" placeholder="title"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('title') }">
                                <has-error :form="form" field="title"></has-error>
                            </div>
                            <div class="form-group">
                                <input v-model="form.body" type="text" name="body"
                                    placeholder="body" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('body') }">
                                <has-error :form="form" field="body"></has-error>
                            </div>
                            <div class="form-group">
                                <select v-model="form.user_id" name="user_id" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('user_id') }">
                                    <option v-for="user in users" :key="user.id" :value="user.id">{{user.name}}</option>
                                </select>
                                <has-error :form="form" field="user_id"></has-error>
                            </div>
                            <div class="form-group">
                                <select v-model="form.track_id" name="track_id" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('track_id') }">
                                    <option v-for="track in tracks" :key="track.id" :value="track.id">{{track.name}}</option>
                                </select>
                                <has-error :form="form" field="track_id"></has-error>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button v-show="editmode" type="submit" class="btn btn-success">Update Article</button>
                            <button v-show="!editmode" type="submit" class="btn btn-primary">Add Article</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                editmode: true,
                tracks:{},
                users: {},
                articles: {},
                form: new Form({
                    id: '',
                    title: '',
                    body: '',
                    user_id: '',
                    track_id: '',
                }),
            }
        },
        methods: {
            newModal() {
                this.editmode = false;
                this.form.reset();
                $('#addarticle').modal('show');
            },
            editModal(article) {
                this.editmode = true;
                this.form.reset();
                this.form.fill(article);
                $('#addarticle').modal('show');
            },
            loadArticles() {
                axios.get('/manage/show-articles').then(({
                    data
                }) => {
                    this.articles = data
                });
                axios.get('/manage/show-users').then(({
                    data
                }) => {
                    this.users = data
                });
                axios.get('/manage/show-tracks').then(({
                    data
                }) => {
                    this.tracks = data
                });
            },
            updateArticle() {
                this.$Progress.start();
                this.form.put('/manage/articles/' + this.form.id)
                    .then(() => {
                        this.loadArticles();
                        $('#addarticle').modal('hide');
                        this.$Progress.finish();
                        swal.fire(
                            'Updated!',
                            'Your Article has been updated.',
                            'success'
                        );
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your Article has been problem.',
                            'error'
                        );
                    });
            },
            creatArticle() {
                this.$Progress.start();
                this.form.post('/manage/articles')
                    .then(() => {
                        this.loadArticles();
                        $('#addarticle').modal('hide');
                        this.$Progress.finish();
                        toast.fire({
                            type: 'success',
                            title: 'Created Article successfully'
                        });
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your Article has been problem.',
                            'error'
                        );
                    });
            },
            deleteArticle(id) {
                swal.fire({
                        title: 'Are you sure?',
                        text: "You won't be able to revert this!",
                        type: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes, delete it!'
                    }).then((result) => {
                        if (result.value) {
                            this.$Progress.start();
                            axios({
                                    method: 'delete',
                                    url: '/manage/articles/' + id,
                                })
                                .then(() => {
                                    this.$Progress.finish();
                                    swal.fire(
                                        'Deleted!',
                                        'Your Article has been deleted.',
                                        'success'
                                    );
                                    this.loadArticles();
                                })
                                .catch(() => {
                                    swal.fire(
                                        'oops!',
                                        'Your Article has been oops.',
                                        'error'
                                    );
                                });
                        }
                    })
                    .catch(() => {})
            }
        },
        created() {
            this.loadArticles();
        }
    }

</script>
