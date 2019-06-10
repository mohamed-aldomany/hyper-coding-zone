<template>
    <div>
        <!-- <router-link to="/profile">profile</router-link> -->
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">user_id</th>
                    <th scope="col">lesson_id</th>
                    <th scope="col">profile_id</th>
                    <th scope="col">Created at</th>
                    <th scope="col">
                        <button type="button" class="btn btn-primary" @click="newModal">
                            Add New Watch_Later
                        </button>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="watch in watchs" :key="watch.id">
                    <th scope="row">{{watch.id}}</th>
                    <td>{{watch.user_id}}</td>
                    <td>{{watch.lesson_id}}</td>
                    <td>{{watch.profile_id}}</td>
                    <td>{{watch.created_at | myDate}}</td>
                    <td>
                        <a href="#" @click="editModal(watch)" class="text-primary"><i
                                class="fa fa-edit fa-lg c-info"></i></a>
                        &nbsp;&nbsp;
                        <a href="#" @click="deleteWatch(watch.id)" class="text-danger"><i
                                class="fa fa-trash fa-lg c-danger"></i></a>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- start modal  -->

        <!-- Modal -->
        <div class="modal fade" id="addwatchlater" tabindex="-1" role="dialog" aria-labelledby="addprofileTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-show="!editmode" class="modal-title" id="addwatchlaterTitle">Add New Watch-later</h5>
                        <h5 v-show="editmode" class="modal-title" id="addwatchlaterTitle">Update Watch-later</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editmode?updateWatch():creatWatch()">
                        <div class="modal-body">
                            <div class="form-group">
                                <select v-model="form.user_id" name="user_id" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('user_id') }">
                                    <option v-for="user in users" :key="user.id" :value="user.id">
                                        {{user.name}}
                                    </option>
                                </select>
                                <has-error :form="form" field="user_id"></has-error>
                            </div>
                            <div class="form-group">
                                <select v-model="form.lesson_id" name="lesson_id" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('lesson_id') }">
                                    <option v-for="lesson in lessons" :key="lesson.id" :value="lesson.id">
                                        {{lesson.name}}
                                    </option>
                                </select>
                                <has-error :form="form" field="lesson_id"></has-error>
                            </div>
                            <div class="form-group">
                                <select v-model="form.profile_id" name="profile_id" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('profile_id') }">
                                    <option v-for="profile in profiles" :key="profile.id" :value="profile.id">
                                        {{profile.name}}
                                    </option>
                                </select>
                                <has-error :form="form" field="profile_id"></has-error>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button v-show="editmode" type="submit" class="btn btn-success">Update Watch-later</button>
                            <button v-show="!editmode" type="submit" class="btn btn-primary">Add Watch-later</button>
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
                users: {},
                lessons: {},
                profiles: {},
                watchs: {},
                form: new Form({
                    id: '',
                    user_id: '',
                    lesson_id: '',
                    profile_id: '',
                }),
            }
        },
        methods: {
            newModal() {
                this.editmode = false;
                this.form.reset();
                $('#addwatchlater').modal('show');
            },
            editModal(watch) {
                this.editmode = true;
                this.form.reset();
                this.form.fill(watch);
                $('#addwatchlater').modal('show');
            },
            loadSuggestions() {
                axios.get('/manage/show-watchs').then(({
                    data
                }) => {
                    this.watchs = data
                });
                axios.get('/manage/show-users').then(({
                    data
                }) => {
                    this.users = data
                });
                axios.get('/manage/show-lessons').then(({
                    data
                }) => {
                    this.lessons = data
                });
                axios.get('/manage/show-profiles').then(({
                    data
                }) => {
                    this.profiles = data
                });
            },
            updateWatch() {
                this.$Progress.start();
                this.form.put('/manage/watchs/' + this.form.id)
                    .then(() => {
                        this.loadSuggestions();
                        $('#addwatchlater').modal('hide');
                        this.$Progress.finish();
                        swal.fire(
                            'Updated!',
                            'Your Watch Later has been updated.',
                            'success'
                        );
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your Watch Later has been problem.',
                            'error'
                        );
                    });
            },
            creatWatch() {
                this.$Progress.start();
                this.form.post('/manage/watchs')
                    .then(() => {
                        this.loadSuggestions();
                        $('#addwatchlater').modal('hide');
                        this.$Progress.finish();
                        toast.fire({
                            type: 'success',
                            title: 'Created Watch Later successfully'
                        });
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your Watch Later has been problem.',
                            'error'
                        );
                    });
            },
           deleteWatch(id) {
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
                                    url: '/manage/watchs/' + id,
                                })
                                .then(() => {
                                    this.$Progress.finish();
                                    swal.fire(
                                        'Deleted!',
                                        'Your Watch Later has been deleted.',
                                        'success'
                                    );
                                    this.loadSuggestions();
                                })
                                .catch(() => {
                                    swal.fire(
                                        'oops!',
                                        'Your Watch Later has been oops.',
                                        'error'
                                    );
                                });
                        }
                    })
                    .catch(() => {})
            }
        },
        created() {
            this.loadSuggestions();
        }
    }

</script>
