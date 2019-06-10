<template>
    <div>
        <!-- <router-link to="/profile">profile</router-link> -->
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">user_id</th>
                    <th scope="col">track_id</th>
                    <th scope="col">profile_id</th>
                    <th scope="col">Created at</th>
                    <th scope="col">
                        <button type="button" class="btn btn-primary" @click="newModal">
                            Add New Track to User
                        </button>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="user_track in user_tracks" :key="user_track.id">
                    <th scope="row">{{user_track.id}}</th>
                    <td>{{user_track.user_id}}</td>
                    <td>{{user_track.track_id}}</td>
                    <td>{{user_track.profile_id}}</td>
                    <td>{{user_track.created_at | myDate}}</td>
                    <td>
                        <a href="#" @click="editModal(user_track)" class="text-primary"><i
                                class="fa fa-edit fa-lg c-info"></i></a>
                        &nbsp;&nbsp;
                        <a href="#" @click="deleteUser_Track(user_track.id)" class="text-danger"><i
                                class="fa fa-trash fa-lg c-danger"></i></a>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- start modal  -->

        <!-- Modal -->
        <div class="modal fade" id="addusertracks" tabindex="-1" role="dialog" aria-labelledby="addprofileTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-show="!editmode" class="modal-title" id="addusertracksTitle">Add New Track to User</h5>
                        <h5 v-show="editmode" class="modal-title" id="addusertracksTitle">Update Track to User</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editmode?updateUserTrack():creatUserTrack()">
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
                                <select v-model="form.track_id" name="track_id" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('track_id') }">
                                    <option v-for="track in tracks" :key="track.id" :value="track.id">
                                        {{track.name}}
                                    </option>
                                </select>
                                <has-error :form="form" field="track_id"></has-error>
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
                            <button v-show="editmode" type="submit" class="btn btn-success">Update User to Track</button>
                            <button v-show="!editmode" type="submit" class="btn btn-primary">Add User to Track</button>
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
                tracks: {},
                profiles: {},
                user_tracks: {},
                form: new Form({
                    id: '',
                    user_id: '',
                    track_id: '',
                    profile_id: '',
                }),
            }
        },
        methods: {
            newModal() {
                this.editmode = false;
                this.form.reset();
                $('#addusertracks').modal('show');
            },
            editModal(user_track) {
                this.editmode = true;
                this.form.reset();
                this.form.fill(user_track);
                $('#addusertracks').modal('show');
            },
            loadUserTracks() {
                axios.get('/manage/show-user_tracks').then(({
                    data
                }) => {
                    this.user_tracks = data
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
                axios.get('/manage/show-profiles').then(({
                    data
                }) => {
                    this.profiles = data
                });
            },
            updateUserTrack() {
                this.$Progress.start();
                this.form.put('/manage/user_tracks/' + this.form.id)
                    .then(() => {
                        this.loadUserTracks();
                        $('#addusertracks').modal('hide');
                        this.$Progress.finish();
                        swal.fire(
                            'Updated!',
                            'Your User Tracks has been updated.',
                            'success'
                        );
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your User Tracks has been problem.',
                            'error'
                        );
                    });
            },
            creatUserTrack() {
                this.$Progress.start();
                this.form.post('/manage/user_tracks')
                    .then(() => {
                        this.loadUserTracks();
                        $('#addusertracks').modal('hide');
                        this.$Progress.finish();
                        toast.fire({
                            type: 'success',
                            title: 'Created User Tracks successfully'
                        });
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your User Tracks has been problem.',
                            'error'
                        );
                    });
            },
           deleteUser_Track(id) {
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
                                    url: '/manage/user_tracks/' + id,
                                })
                                .then(() => {
                                    this.$Progress.finish();
                                    swal.fire(
                                        'Deleted!',
                                        'Your User Tracks has been deleted.',
                                        'success'
                                    );
                                    this.loadUserTracks();
                                })
                                .catch(() => {
                                    swal.fire(
                                        'oops!',
                                        'Your User Tracks has been oops.',
                                        'error'
                                    );
                                });
                        }
                    })
                    .catch(() => {})
            }
        },
        created() {
            this.loadUserTracks();
        }
    }

</script>
