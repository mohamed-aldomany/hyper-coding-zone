<template>
    <div>
        <!-- <router-link to="/profile">profile</router-link> -->
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">user_id</th>
                    <th scope="col">profile_id</th>
                    <th scope="col">Created at</th>
                    <th scope="col">
                        <button type="button" class="btn btn-primary" @click="newModal">
                            Add New Profile to User
                        </button>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="user_profile in user_profiles" :key="user_profile.id">
                    <th scope="row">{{user_profile.id}}</th>
                    <td>{{user_profile.user_id}}</td>
                    <td>{{user_profile.profile_id}}</td>
                    <td>{{user_profile.created_at | myDate}}</td>
                    <td>
                        <a href="#" @click="editModal(user_profile)" class="text-primary"><i
                                class="fa fa-edit fa-lg c-info"></i></a>
                        &nbsp;&nbsp;
                        <a href="#" @click="deleteUser_Profile(user_profile.id)" class="text-danger"><i
                                class="fa fa-trash fa-lg c-danger"></i></a>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- start modal  -->

        <!-- Modal -->
        <div class="modal fade" id="adduserprofile" tabindex="-1" role="dialog" aria-labelledby="addprofileTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-show="!editmode" class="modal-title" id="adduserprofileTitle">Add New User to Profile</h5>
                        <h5 v-show="editmode" class="modal-title" id="adduserprofileTitle">Update User to Profile</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editmode?updateUserProfile():creatUserProfile()">
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
                            <button v-show="editmode" type="submit" class="btn btn-success">Update Profile to User</button>
                            <button v-show="!editmode" type="submit" class="btn btn-primary">Add Profile to User</button>
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
                profiles: {},
                user_profiles: {},
                form: new Form({
                    id: '',
                    user_id: '',
                    profile_id: '',
                }),
            }
        },
        methods: {
            newModal() {
                this.editmode = false;
                this.form.reset();
                $('#adduserprofile').modal('show');
            },
            editModal(watch) {
                this.editmode = true;
                this.form.reset();
                this.form.fill(watch);
                $('#adduserprofile').modal('show');
            },
            loadUserProfile() {
                axios.get('/manage/show-user_profiles').then(({
                    data
                }) => {
                    this.user_profiles = data
                });
                axios.get('/manage/show-users').then(({
                    data
                }) => {
                    this.users = data
                });
                axios.get('/manage/show-profiles').then(({
                    data
                }) => {
                    this.profiles = data
                });
            },
            updateUserProfile() {
                this.$Progress.start();
                this.form.put('/manage/user_profiles/' + this.form.id)
                    .then(() => {
                        this.loadUserProfile();
                        $('#adduserprofile').modal('hide');
                        this.$Progress.finish();
                        swal.fire(
                            'Updated!',
                            'Your User Profile has been updated.',
                            'success'
                        );
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your User Profile has been problem.',
                            'error'
                        );
                    });
            },
            creatUserProfile() {
                this.$Progress.start();
                this.form.post('/manage/user_profiles')
                    .then(() => {
                        this.loadUserProfile();
                        $('#adduserprofile').modal('hide');
                        this.$Progress.finish();
                        toast.fire({
                            type: 'success',
                            title: 'Created User Profile successfully'
                        });
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your User Profile has been problem.',
                            'error'
                        );
                    });
            },
            deleteUser_Profile(id) {
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
                                    url: '/manage/user_profiles/' + id,
                                })
                                .then(() => {
                                    this.$Progress.finish();
                                    swal.fire(
                                        'Deleted!',
                                        'Your User Profile has been deleted.',
                                        'success'
                                    );
                                    this.loadUserProfile();
                                })
                                .catch(() => {
                                    swal.fire(
                                        'oops!',
                                        'Your User Profile has been oops.',
                                        'error'
                                    );
                                });
                        }
                    })
                    .catch(() => {})
            }
        },
        created() {
            this.loadUserProfile();
        }
    }

</script>
