<template>
    <div>
        <!-- <router-link to="/profile">profile</router-link> -->
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">reply</th>
                    <th scope="col">user_id</th>
                    <th scope="col">comment_id</th>
                    <th scope="col">Created at</th>
                    <th scope="col">
                        <button type="button" class="btn btn-primary" @click="newModal">
                            Add New reply
                        </button>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="reply in replies" :key="reply.id">
                    <th scope="row">{{reply.id}}</th>
                    <td>{{reply.reply}}</td>
                    <td>{{reply.user_id}}</td>
                    <td>{{reply.comment_id}}</td>
                    <td>{{reply.created_at | myDate}}</td>
                    <td>
                        <a href="#" @click="editModal(reply)" class="text-primary"><i
                                class="fa fa-edit fa-lg c-info"></i></a>
                        &nbsp;&nbsp;
                        <a href="#" @click="deleteReply(reply.id)" class="text-danger"><i
                                class="fa fa-trash fa-lg c-danger"></i></a>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- start modal  -->

        <!-- Modal -->
        <div class="modal fade" id="addreply" tabindex="-1" role="dialog" aria-labelledby="addprofileTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-show="!editmode" class="modal-title" id="addreplyTitle">Add New Reply</h5>
                        <h5 v-show="editmode" class="modal-title" id="addreplyTitle">Update Reply Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editmode?updateReply():creatReply()">
                        <div class="modal-body">
                            <div class="form-group">
                                <input v-model="form.reply" type="text" title="reply" placeholder="reply"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('reply') }">
                                <has-error :form="form" field="reply"></has-error>
                            </div>
                            <div class="form-group">
                                <select v-model="form.user_id" name="user_id" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('user_id') }">
                                    <option v-for="user in users" :key="user.id" :value="user.id">{{user.name}}</option>
                                </select>
                                <has-error :form="form" field="user_id"></has-error>
                            </div>
                            <div class="form-group">
                                <select v-model="form.comment_id" name="comment_id" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('comment_id') }">
                                    <option v-for="comment in comments" :key="comment.id" :value="comment.id">
                                        {{comment.comment}}</option>
                                </select>
                                <has-error :form="form" field="comment_id"></has-error>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button v-show="editmode" type="submit" class="btn btn-success">Update Reply</button>
                            <button v-show="!editmode" type="submit" class="btn btn-primary">Add Reply</button>
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
                comments: {},
                users: {},
                replies: {},
                form: new Form({
                    id: '',
                    reply: '',
                    user_id: '',
                    comment_id: '',
                }),
            }
        },
        methods: {
            newModal() {
                this.editmode = false;
                this.form.reset();
                $('#addreply').modal('show');
            },
            editModal(reply) {
                this.editmode = true;
                this.form.reset();
                this.form.fill(reply);
                $('#addreply').modal('show');
            },
            loadReplies() {
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
                axios.get('/manage/show-replies').then(({
                    data
                }) => {
                    this.replies = data
                });
            },
            updateReply() {
                this.$Progress.start();
                this.form.put('/manage/replies/' + this.form.id)
                    .then(() => {
                        this.loadReplies();
                        $('#addreply').modal('hide');
                        this.$Progress.finish();
                        swal.fire(
                            'Updated!',
                            'Your Reply has been updated.',
                            'success'
                        );
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your Reply has been problem.',
                            'error'
                        );
                    });
            },
            creatReply() {
                this.$Progress.start();
                this.form.post('/manage/replies')
                    .then(() => {
                        this.loadReplies();
                        $('#addreply').modal('hide');
                        this.$Progress.finish();
                        toast.fire({
                            type: 'success',
                            title: 'Created Reply successfully'
                        });
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your Reply has been problem.',
                            'error'
                        );
                    });
            },
            deleteReply(id) {
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
                                    url: '/manage/replies/' + id,
                                })
                                .then(() => {
                                    this.$Progress.finish();
                                    swal.fire(
                                        'Deleted!',
                                        'Your Reply has been deleted.',
                                        'success'
                                    );
                                    this.loadReplies();
                                })
                                .catch(() => {
                                    swal.fire(
                                        'oops!',
                                        'Your Reply has been oops.',
                                        'error'
                                    );
                                });
                        }
                    })
                    .catch(() => {})
            }
        },
        created() {
            this.loadReplies();
        }
    }

</script>
