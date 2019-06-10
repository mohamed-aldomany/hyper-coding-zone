<template>
    <div>
        <!-- <router-link to="/profile">profile</router-link> -->
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Description</th>
                    <th scope="col">Created at</th>
                    <th scope="col">
                        <button type="button" class="btn btn-primary" @click="newModal">
                            Add New Profile
                        </button>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="profile in profiles" :key="profile.id">
                    <th scope="row">{{profile.id}}</th>
                    <td>{{profile.name}}</td>
                    <td>{{profile.description}}</td>
                    <td>{{profile.created_at | myDate}}</td>
                    <td>
                        <a href="#" @click="editModal(profile)" class="text-primary"><i
                                class="fa fa-edit fa-lg c-info"></i></a>
                        &nbsp;&nbsp;
                        <a href="#" @click="deleteProfile(profile.id)" class="text-danger"><i
                                class="fa fa-trash fa-lg c-danger"></i></a>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- start modal  -->

        <!-- Modal -->
        <div class="modal fade" id="addprofile" tabindex="-1" role="dialog" aria-labelledby="addprofileTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-show="!editmode" class="modal-title" id="addprofileTitle">Add New Profile</h5>
                        <h5 v-show="editmode" class="modal-title" id="addprofileTitle">Update Profile Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editmode?updateProfile():creatProfile()">
                        <div class="modal-body">
                            <div class="form-group">
                                <input v-model="form.name" type="text" name="name" placeholder="name"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('name') }">
                                <has-error :form="form" field="name"></has-error>
                            </div>
                            <div class="form-group">
                                <input v-model="form.description" type="text" name="description"
                                    placeholder="description" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('description') }">
                                <has-error :form="form" field="description"></has-error>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button v-show="editmode" type="submit" class="btn btn-success">Update Profile</button>
                            <button v-show="!editmode" type="submit" class="btn btn-primary">Add P</button>
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
                profiles: {},
                form: new Form({
                    id: '',
                    name: '',
                    description: ''
                }),
            }
        },
        methods: {
            newModal() {
                this.editmode = false;
                this.form.reset();
                $('#addprofile').modal('show');
            },
            editModal(user) {
                this.editmode = true;
                this.form.reset();
                this.form.fill(user);
                $('#addprofile').modal('show');
            },
            loadProfile() {
                axios.get('/manage/show-profiles').then(({
                    data
                }) => {
                    this.profiles = data
                });
            },
            updateProfile() {
                this.$Progress.start();
                this.form.put('/manage/profiles/' + this.form.id)
                    .then(() => {
                        this.loadProfile();
                        $('#addprofile').modal('hide');
                        this.$Progress.finish();
                        swal.fire(
                            'Updated!',
                            'Your profile has been updated.',
                            'success'
                        );
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your profile has been problem.',
                            'error'
                        );
                    });
            },
            creatProfile() {
                this.$Progress.start();
                this.form.post('/manage/profiles')
                    .then(() => {
                        this.loadProfile();
                        $('#addprofile').modal('hide');
                        this.$Progress.finish();
                        toast.fire({
                            type: 'success',
                            title: 'Created Profile successfully'
                        });
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your Profile has been problem.',
                            'error'
                        );
                    });
            },
            deleteProfile(id) {
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
                                    url: '/manage/profiles/' + id,
                                })
                                .then(() => {
                                    this.$Progress.finish();
                                    swal.fire(
                                        'Deleted!',
                                        'Your profile has been deleted.',
                                        'success'
                                    );
                                    this.loadProfile();
                                })
                                .catch(() => {
                                    swal.fire(
                                        'oops!',
                                        'Your profile has been oops.',
                                        'error'
                                    );
                                });
                        }
                    })
                    .catch(() => {})
            }
        },
        created() {
            this.loadProfile();
        }
    }

</script>
