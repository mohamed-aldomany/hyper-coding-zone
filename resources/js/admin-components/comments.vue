<template>
    <div>
        <!-- <router-link to="/profile">profile</router-link> -->
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">comment</th>
                    <th scope="col">user_id</th>
                    <th scope="col">article_id</th>
                    <th scope="col">Created at</th>
                    <th scope="col">
                        <button type="button" class="btn btn-primary" @click="newModal">
                            Add New Comment
                        </button>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="comment in comments" :key="comment.id">
                    <th scope="row">{{comment.id}}</th>
                    <td>{{comment.comment}}</td>
                    <td>{{comment.user_id}}</td>
                    <td>{{comment.article_id}}</td>
                    <td>{{comment.created_at | myDate}}</td>
                    <td>
                        <a href="#" @click="editModal(comment)" class="text-primary"><i
                                class="fa fa-edit fa-lg c-info"></i></a>
                        &nbsp;&nbsp;
                        <a href="#" @click="deleteComment(comment.id)" class="text-danger"><i
                                class="fa fa-trash fa-lg c-danger"></i></a>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- start modal  -->

        <!-- Modal -->
        <div class="modal fade" id="addcomment" tabindex="-1" role="dialog" aria-labelledby="addprofileTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-show="!editmode" class="modal-title" id="addcommentTitle">Add New Comment</h5>
                        <h5 v-show="editmode" class="modal-title" id="addcommentTitle">Update Comment Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editmode?updateComment():creatComment()">
                        <div class="modal-body">
                            <div class="form-group">
                                <input v-model="form.comment" type="text" title="comment" placeholder="comment"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('comment') }">
                                <has-error :form="form" field="comment"></has-error>
                            </div>
                            <div class="form-group">
                                <select v-model="form.user_id" name="user_id" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('user_id') }">
                                    <option v-for="user in users" :key="user.id" :value="user.id">{{user.name}}</option>
                                </select>
                                <has-error :form="form" field="user_id"></has-error>
                            </div>
                            <div class="form-group">
                                <select v-model="form.article_id" name="article_id" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('article_id') }">
                                    <option v-for="article in articles" :key="article.id" :value="article.id">{{article.title}}</option>
                                </select>
                                <has-error :form="form" field="article_id"></has-error>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button v-show="editmode" type="submit" class="btn btn-success">Update Comment</button>
                            <button v-show="!editmode" type="submit" class="btn btn-primary">Add Comment</button>
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
                comments:{},
                users: {},
                articles: {},
                form: new Form({
                    id: '',
                    comment: '',
                    user_id: '',
                    article_id: '',
                }),
            }
        },
        methods: {
            newModal() {
                this.editmode = false;
                this.form.reset();
                $('#addcomment').modal('show');
            },
            editModal(comment) {
                this.editmode = true;
                this.form.reset();
                this.form.fill(comment);
                $('#addcomment').modal('show');
            },
            loadComments() {
                axios.get('/manage/show-comments').then(({
                    data
                }) => {
                    this.comments = data
                });
                axios.get('/manage/show-users').then(({
                    data
                }) => {
                    this.users = data
                });
                axios.get('/manage/show-articles').then(({
                    data
                }) => {
                    this.articles = data
                });
            },
            updateComment() {
                this.$Progress.start();
                this.form.put('/manage/comments/' + this.form.id)
                    .then(() => {
                        this.loadComments();
                        $('#addcomment').modal('hide');
                        this.$Progress.finish();
                        swal.fire(
                            'Updated!',
                            'Your Comment has been updated.',
                            'success'
                        );
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your Comment has been problem.',
                            'error'
                        );
                    });
            },
            creatComment() {
                this.$Progress.start();
                this.form.post('/manage/comments')
                    .then(() => {
                        this.loadComments();
                        $('#addcomment').modal('hide');
                        this.$Progress.finish();
                        toast.fire({
                            type: 'success',
                            title: 'Created Comment successfully'
                        });
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your Comment has been problem.',
                            'error'
                        );
                    });
            },
            deleteComment(id) {
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
                                    url: '/manage/comments/' + id,
                                })
                                .then(() => {
                                    this.$Progress.finish();
                                    swal.fire(
                                        'Deleted!',
                                        'Your Comment has been deleted.',
                                        'success'
                                    );
                                    this.loadComments();
                                })
                                .catch(() => {
                                    swal.fire(
                                        'oops!',
                                        'Your Comment has been oops.',
                                        'error'
                                    );
                                });
                        }
                    })
                    .catch(() => {})
            }
        },
        created() {
            this.loadComments();
        }
    }

</script>
