<template>
    <div>
        <!-- <router-link to="/profile">profile</router-link> -->
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">name</th>
                    <th scope="col">description</th>
                    <th scope="col">user_id</th>
                    <th scope="col">Created at</th>
                    <th scope="col">
                        <button type="button" class="btn btn-primary" @click="newModal">
                            Add New Suggest
                        </button>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="suggest in suggestions" :key="suggest.id">
                    <th scope="row">{{suggest.id}}</th>
                    <th scope="row">{{suggest.name}}</th>
                    <td>{{suggest.description.substring(0,90)+"...."}}</td>
                    <td>{{suggest.user_id}}</td>
                    <td>{{suggest.created_at | myDate}}</td>
                    <td>
                        <a href="#" @click="editModal(suggest)" class="text-primary"><i
                                class="fa fa-edit fa-lg c-info"></i></a>
                        &nbsp;&nbsp;
                        <a href="#" @click="deleteSuggest(suggest.id)" class="text-danger"><i
                                class="fa fa-trash fa-lg c-danger"></i></a>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- start modal  -->

        <!-- Modal -->
        <div class="modal fade" id="addsuggest" tabindex="-1" role="dialog" aria-labelledby="addprofileTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-show="!editmode" class="modal-title" id="addsuggestTitle">Add New Suggest</h5>
                        <h5 v-show="editmode" class="modal-title" id="addsuggestTitle">Update Suggest</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editmode?updateSuggest():creatSuggest()">
                        <div class="modal-body">
                            <div class="form-group">
                                <input v-model="form.name" type="text" name="name" placeholder="name"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('name') }">
                                <has-error :form="form" field="name"></has-error>
                            </div>
                            <div class="form-group">
                                <input v-model="form.description" type="text" name="description" placeholder="description"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('description') }">
                                <has-error :form="form" field="description"></has-error>
                            </div>
                            <div class="form-group">
                                <select v-model="form.user_id" name="user_id" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('user_id') }">
                                    <option v-for="user in users" :key="user.id" :value="user.id">
                                        {{user.name}}
                                    </option>
                                </select>
                                <has-error :form="form" field="user_id"></has-error>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button v-show="editmode" type="submit" class="btn btn-success">Update Suggest</button>
                            <button v-show="!editmode" type="submit" class="btn btn-primary">Add Suggest</button>
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
                suggestions: {},
                form: new Form({
                    id: '',
                    name: '',
                    description: '',
                    user_id: '',
                }),
            }
        },
        methods: {
            newModal() {
                this.editmode = false;
                this.form.reset();
                $('#addsuggest').modal('show');
            },
            editModal(suggest) {
                this.editmode = true;
                this.form.reset();
                this.form.fill(suggest);
                $('#addsuggest').modal('show');
            },
            loadSuggestions() {
                axios.get('/manage/show-suggestions').then(({
                    data
                }) => {
                    this.suggestions = data
                });
                axios.get('/manage/show-users').then(({
                    data
                }) => {
                    this.users = data
                });
            },
            updateSuggest() {
                this.$Progress.start();
                this.form.put('/manage/suggestions/' + this.form.id)
                    .then(() => {
                        this.loadSuggestions();
                        $('#addsuggest').modal('hide');
                        this.$Progress.finish();
                        swal.fire(
                            'Updated!',
                            'Your Suggestions has been updated.',
                            'success'
                        );
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your Suggestions has been problem.',
                            'error'
                        );
                    });
            },
            creatSuggest() {
                this.$Progress.start();
                this.form.post('/manage/suggestions')
                    .then(() => {
                        this.loadSuggestions();
                        $('#addsuggest').modal('hide');
                        this.$Progress.finish();
                        toast.fire({
                            type: 'success',
                            title: 'Created Suggestions successfully'
                        });
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your Suggestions has been problem.',
                            'error'
                        );
                    });
            },
           deleteSuggest(id) {
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
                                    url: '/manage/suggestions/' + id,
                                })
                                .then(() => {
                                    this.$Progress.finish();
                                    swal.fire(
                                        'Deleted!',
                                        'Your Suggestions has been deleted.',
                                        'success'
                                    );
                                    this.loadSuggestions();
                                })
                                .catch(() => {
                                    swal.fire(
                                        'oops!',
                                        'Your Suggestions has been oops.',
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
