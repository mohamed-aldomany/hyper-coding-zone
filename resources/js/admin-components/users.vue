<template>
    <div>
        <!-- <router-link to="/profile">profile</router-link> -->
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">email</th>
                    <th scope="col">Group_ID</th>
                    <th scope="col">Register at</th>
                    <th scope="col">
                        <button type="button" class="btn btn-primary" @click="newModal">
                            Add New User
                        </button>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="user in users" :key="user.id">
                    <th scope="row">{{user.id}}</th>
                    <td>{{user.name}}</td>
                    <td>{{user.email}}</td>
                    <td>{{user.group_id}}</td>
                    <td>{{user.created_at | myDate}}</td>
                    <td>
                        <a href="#" @click="editModal(user)" class="text-primary"><i
                                class="fa fa-edit fa-lg c-info"></i></a>
                        &nbsp;&nbsp;
                        <a href="#" @click="deleteUser(user.id)" class="text-danger"><i
                                class="fa fa-trash fa-lg c-danger"></i></a>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- start modal  -->

        <!-- Modal -->
        <div class="modal fade" id="adduser" tabindex="-1" role="dialog" aria-labelledby="adduserTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-show="!editmode" class="modal-title" id="adduserTitle">Add New User</h5>
                        <h5 v-show="editmode" class="modal-title" id="adduserTitle">Update User Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editmode?updateUser():creatUser()">
                        <div class="modal-body">
                            <div class="form-group">
                                <input v-model="form.name" type="text" name="name" placeholder="name"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('name') }">
                                <has-error :form="form" field="name"></has-error>
                            </div>
                            <div class="form-group">
                                <input v-model="form.email" type="text" name="email" placeholder="email"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('email') }">
                                <has-error :form="form" field="email"></has-error>
                            </div>
                            <div class="form-group">
                                <select v-model="form.group_id" name="group_id" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('group_id') }">
                                    <option value="0">User</option>
                                    <option value="1">Admin</option>
                                </select>
                                <has-error :form="form" field="group_id"></has-error>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button v-show="editmode" type="submit" class="btn btn-success">Update Data</button>
                            <button v-show="!editmode" type="submit" class="btn btn-primary">Add User</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {

    }

</script>

<style>

</style>

<script>
    export default {
        data() {
            return {
                editmode: true,
                users: {},
                form: new Form({
                    id: '',
                    name: '',
                    email: '',
                    group_id: ''
                }),
            }
        },
        methods: {
            newModal() {
                this.editmode = false;
                this.form.reset();
                $('#adduser').modal('show');
            },
            editModal(user) {
                this.editmode = true;
                this.form.reset();
                this.form.fill(user);
                $('#adduser').modal('show');
            },
            loadUser() {
                axios.get('/manage/show-users').then(({
                    data
                }) => {
                    this.users = data
                });
            },
            updateUser() {
                this.$Progress.start();
                this.form.put('/manage/users/' + this.form.id)
                    .then(() => {
                        this.loadUser();
                        $('#adduser').modal('hide');
                        this.$Progress.finish();
                        swal.fire(
                            'Updated!',
                            'Your user has been updated.',
                            'success'
                        );
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your user has been problem.',
                            'error'
                        );
                    });
            },
            creatUser() {
                this.$Progress.start();
                this.form.post('/manage/users')
                    .then(() => {
                        this.loadUser();
                        $('#adduser').modal('hide');
                        this.$Progress.finish();
                        toast.fire({
                            type: 'success',
                            title: 'Created User successfully'
                        });
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your user has been problem.',
                            'error'
                        );
                    });
            },
            deleteUser(id) {
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
                                    url: '/manage/users/' + id,
                                })
                                .then(() => {
                                    this.$Progress.finish();
                                    swal.fire(
                                        'Deleted!',
                                        'Your user has been deleted.',
                                        'success'
                                    );
                                    this.loadUser();
                                })
                                .catch(() => {
                                    swal.fire(
                                        'oops!',
                                        'Your user has been oops.',
                                        'error'
                                    );
                                });
                        }
                    })
                    .catch(() => {})
            }
        },
        created() {
            this.loadUser();
        }
    }

</script>
