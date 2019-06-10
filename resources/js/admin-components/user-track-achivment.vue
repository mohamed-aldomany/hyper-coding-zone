<template>
    <div>
        <!-- <router-link to="/profile">profile</router-link> -->
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">user_id</th>
                    <th scope="col">track_achivment_id</th>
                    <th scope="col">Created at</th>
                    <th scope="col">
                        <button type="button" class="btn btn-primary" @click="newModal">
                            Add New Track Achivment to User
                        </button>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="achivment in user_track_achivments" :key="achivment.id">
                    <th scope="row">{{achivment.id}}</th>
                    <td>{{achivment.user_id}}</td>
                    <td>{{achivment.track_achivment_id}}</td>
                    <td>{{achivment.created_at | myDate}}</td>
                    <td>
                        <a href="#" @click="editModal(achivment)" class="text-primary"><i
                                class="fa fa-edit fa-lg c-info"></i></a>
                        &nbsp;&nbsp;
                        <a href="#" @click="deleteUserAchivment(achivment.id)" class="text-danger"><i
                                class="fa fa-trash fa-lg c-danger"></i></a>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- start modal  -->

        <!-- Modal -->
        <div class="modal fade" id="addachivment" tabindex="-1" role="dialog" aria-labelledby="addprofileTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-show="!editmode" class="modal-title" id="addachivmentTitle">Add New Track Achivment to User</h5>
                        <h5 v-show="editmode" class="modal-title" id="addachivmentTitle">Update Track Achivment to User</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editmode?updateUserAchivment():creatUserAchivment()">
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
                                <select v-model="form.track_achivment_id" name="track_achivment_id" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('track_achivment_id') }">
                                    <option v-for="achivment in achivments" :key="achivment.id" :value="achivment.id">
                                        {{achivment.title}}
                                    </option>
                                </select>
                                <has-error :form="form" field="track_achivment_id"></has-error>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button v-show="editmode" type="submit" class="btn btn-success">Update Track Achivment to User</button>
                            <button v-show="!editmode" type="submit" class="btn btn-primary">Add Track Achivment to User</button>
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
                achivments: {},
                user_track_achivments: {},
                form: new Form({
                    id: '',
                    user_id: '',
                    track_achivment_id: '',
                }),
            }
        },
        methods: {
            newModal() {
                this.editmode = false;
                this.form.reset();
                $('#addachivment').modal('show');
            },
            editModal(achivment) {
                this.editmode = true;
                this.form.reset();
                this.form.fill(achivment);
                $('#addachivment').modal('show');
            },
            loadUserTrackAchivments() {
                axios.get('/manage/show-user_track_achivments').then(({
                    data
                }) => {
                    this.user_track_achivments = data
                });
                axios.get('/manage/show-users').then(({
                    data
                }) => {
                    this.users = data
                });
                axios.get('/manage/show-track_achivments').then(({
                    data
                }) => {
                    this.achivments = data
                });
            },
            updateUserAchivment() {
                this.$Progress.start();
                this.form.put('/manage/user_track_achivments/' + this.form.id)
                    .then(() => {
                        this.loadUserTrackAchivments();
                        $('#addachivment').modal('hide');
                        this.$Progress.finish();
                        swal.fire(
                            'Updated!',
                            'Your User Track Achivments has been updated.',
                            'success'
                        );
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your User Track Achivments has been problem.',
                            'error'
                        );
                    });
            },
            creatUserAchivment() {
                this.$Progress.start();
                this.form.post('/manage/user_track_achivments')
                    .then(() => {
                        this.loadUserTrackAchivments();
                        $('#addachivment').modal('hide');
                        this.$Progress.finish();
                        toast.fire({
                            type: 'success',
                            title: 'Created User Track Achivments successfully'
                        });
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your User Track Achivments has been problem.',
                            'error'
                        );
                    });
            },
           deleteUserAchivment(id) {
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
                                    url: '/manage/user_track_achivments/' + id,
                                })
                                .then(() => {
                                    this.$Progress.finish();
                                    swal.fire(
                                        'Deleted!',
                                        'Your User Track Achivments has been deleted.',
                                        'success'
                                    );
                                    this.loadUserTrackAchivments();
                                })
                                .catch(() => {
                                    swal.fire(
                                        'oops!',
                                        'Your User Track Achivments has been oops.',
                                        'error'
                                    );
                                });
                        }
                    })
                    .catch(() => {})
            }
        },
        created() {
            this.loadUserTrackAchivments();
        }
    }

</script>
