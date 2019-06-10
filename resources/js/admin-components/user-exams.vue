<template>
    <div>
        <!-- <router-link to="/profile">profile</router-link> -->
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">user_id</th>
                    <th scope="col">exam_id</th>
                    <th scope="col">profile_id</th>
                    <th scope="col">score</th>
                    <th scope="col">created_at</th>
                    <th scope="col">
                        <button type="button" class="btn btn-primary" @click="newModal">
                            Add New Exam to User
                        </button>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="user_exam in user_exams" :key="user_exam.id">
                    <th scope="row">{{user_exam.id}}</th>
                    <td>{{user_exam.user_id}}</td>
                    <td>{{user_exam.exam_id}}</td>
                    <td>{{user_exam.profile_id}}</td>
                    <td>{{user_exam.score}}</td>
                    <td>{{user_exam.created_at}}</td>
                    <td>
                        <a href="#" @click="editModal(user_exam)" class="text-primary"><i
                                class="fa fa-edit fa-lg c-info"></i></a>
                        &nbsp;&nbsp;
                        <a href="#" @click="deleteUser_exam(user_exam.id)" class="text-danger"><i
                                class="fa fa-trash fa-lg c-danger"></i></a>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- start modal  -->

        <!-- Modal -->
        <div class="modal fade" id="adduserexams" tabindex="-1" role="dialog" aria-labelledby="addprofileTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-show="!editmode" class="modal-title" id="adduserexamsTitle">Add New Exam to User</h5>
                        <h5 v-show="editmode" class="modal-title" id="adduserexamsTitle">Update Exam to User</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editmode?updateUserExam():creatUserExam()">
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
                                <select v-model="form.exam_id" name="exam_id" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('exam_id') }">
                                    <option v-for="exam in exams" :key="exam.id" :value="exam.id">
                                        {{exam.name}}
                                    </option>
                                </select>
                                <has-error :form="form" field="exam_id"></has-error>
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
                            <div class="form-group">
                                <input v-model="form.score" type="text" name="score" placeholder="score"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('score') }">
                                <has-error :form="form" field="score"></has-error>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button v-show="editmode" type="submit" class="btn btn-success">Update User to Exam</button>
                            <button v-show="!editmode" type="submit" class="btn btn-primary">Add User to Exam</button>
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
                exams: {},
                user_exams: {},
                form: new Form({
                    id: '',
                    user_id: '',
                    exam_id: '',
                    profile_id: '',
                    score: ''
                }),
            }
        },
        methods: {
            newModal() {
                this.editmode = false;
                this.form.reset();
                $('#adduserexams').modal('show');
            },
            editModal(user_exam) {
                this.editmode = true;
                this.form.reset();
                this.form.fill(user_exam);
                $('#adduserexams').modal('show');
            },
            loadUserExams() {
                axios.get('/manage/show-user_exams').then(({
                    data
                }) => {
                    this.user_exams = data
                });
                axios.get('/manage/show-users').then(({
                    data
                }) => {
                    this.users = data
                });
                axios.get('/manage/show-exams').then(({
                    data
                }) => {
                    this.exams = data
                });
                axios.get('/manage/show-profiles').then(({
                    data
                }) => {
                    this.profiles = data
                });
            },
            updateUserExam() {
                this.$Progress.start();
                this.form.put('/manage/user_exams/' + this.form.id)
                    .then(() => {
                        this.loadUserExams();
                        $('#adduserexams').modal('hide');
                        this.$Progress.finish();
                        swal.fire(
                            'Updated!',
                            'Your User Exams has been updated.',
                            'success'
                        );
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your User Exams has been problem.',
                            'error'
                        );
                    });
            },
            creatUserExam() {
                this.$Progress.start();
                this.form.post('/manage/user_exams')
                    .then(() => {
                        this.loadUserExams();
                        $('#adduserexams').modal('hide');
                        this.$Progress.finish();
                        toast.fire({
                            type: 'success',
                            title: 'Created User Exams successfully'
                        });
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your User Exams has been problem.',
                            'error'
                        );
                    });
            },
           deleteUser_exam(id) {
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
                                    url: '/manage/user_exams/' + id,
                                })
                                .then(() => {
                                    this.$Progress.finish();
                                    swal.fire(
                                        'Deleted!',
                                        'Your User Exams has been deleted.',
                                        'success'
                                    );
                                    this.loadUserExams();
                                })
                                .catch(() => {
                                    swal.fire(
                                        'oops!',
                                        'Your User Exams has been oops.',
                                        'error'
                                    );
                                });
                        }
                    })
                    .catch(() => {})
            }
        },
        created() {
            this.loadUserExams();
        }
    }

</script>
