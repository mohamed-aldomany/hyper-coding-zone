<template>
    <div>
        <!-- <router-link to="/profile">profile</router-link> -->
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Description</th>
                    <th scope="col">Sorting</th>
                    <th scope="col">Created at</th>
                    <th scope="col">
                        <button type="button" class="btn btn-primary" @click="newModal">
                            Add New Track
                        </button>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="track in tracks" :key="track.id">
                    <th scope="row">{{track.id}}</th>
                    <td>{{track.name}}</td>
                    <td>{{track.description}}</td>
                    <td>{{track.sorting}}</td>
                    <td>{{track.created_at | myDate}}</td>
                    <td>
                        <a href="#" @click="editModal(track)" class="text-primary"><i
                                class="fa fa-edit fa-lg c-info"></i></a>
                        &nbsp;&nbsp;
                        <a href="#" @click="deleteTrack(track.id)" class="text-danger"><i
                                class="fa fa-trash fa-lg c-danger"></i></a>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- start modal  -->

        <!-- Modal -->
        <div class="modal fade" id="addtrack" tabindex="-1" role="dialog" aria-labelledby="addprofileTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-show="!editmode" class="modal-title" id="addtrackTitle">Add New Track</h5>
                        <h5 v-show="editmode" class="modal-title" id="addtrackTitle">Update Track Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editmode?updateTrack():creatTrack()">
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
                            <div class="form-group">
                                <input v-model="form.sorting" type="number" name="sorting"
                                    placeholder="sorting" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('sorting') }">
                                <has-error :form="form" field="sorting"></has-error>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button v-show="editmode" type="submit" class="btn btn-success">Update Track</button>
                            <button v-show="!editmode" type="submit" class="btn btn-primary">Add Track</button>
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
                tracks: {},
                form: new Form({
                    id: '',
                    name: '',
                    description: '',
                    sorting:''
                }),
            }
        },
        methods: {
            newModal() {
                this.editmode = false;
                this.form.reset();
                $('#addtrack').modal('show');
            },
            editModal(user) {
                this.editmode = true;
                this.form.reset();
                this.form.fill(user);
                $('#addtrack').modal('show');
            },
            loadTrack() {
                axios.get('/manage/show-tracks').then(({
                    data
                }) => {
                    this.tracks = data
                });
            },
            updateTrack() {
                this.$Progress.start();
                this.form.put('/manage/tracks/' + this.form.id)
                    .then(() => {
                        this.loadTrack();
                        $('#addtrack').modal('hide');
                        this.$Progress.finish();
                        swal.fire(
                            'Updated!',
                            'Your Track has been updated.',
                            'success'
                        );
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your Track has been problem.',
                            'error'
                        );
                    });
            },
            creatTrack() {
                this.$Progress.start();
                this.form.post('/manage/tracks')
                    .then(() => {
                        this.loadTrack();
                        $('#addtrack').modal('hide');
                        this.$Progress.finish();
                        toast.fire({
                            type: 'success',
                            title: 'Created Track successfully'
                        });
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your Track has been problem.',
                            'error'
                        );
                    });
            },
            deleteTrack(id) {
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
                                    url: '/manage/tracks/' + id,
                                })
                                .then(() => {
                                    this.$Progress.finish();
                                    swal.fire(
                                        'Deleted!',
                                        'Your Track has been deleted.',
                                        'success'
                                    );
                                    this.loadTrack();
                                })
                                .catch(() => {
                                    swal.fire(
                                        'oops!',
                                        'Your Track has been oops.',
                                        'error'
                                    );
                                });
                        }
                    })
                    .catch(() => {})
            }
        },
        created() {
            this.loadTrack();
        }
    }

</script>
