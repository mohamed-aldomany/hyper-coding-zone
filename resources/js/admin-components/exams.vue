<template>
    <div>
        <!-- <router-link to="/profile">profile</router-link> -->
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Result</th>
                    <th scope="col">Passing</th>
                    <th scope="col">Course</th>
                    <th scope="col">Created at</th>
                    <th scope="col">
                        <button type="button" class="btn btn-primary" @click="newModal">
                            Add New Exam
                        </button>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="exam in exams" :key="exam.id">
                    <th scope="row">{{exam.id}}</th>
                    <td>{{exam.name}}</td>
                    <td>{{exam.result}}</td>
                    <td>{{exam.passing}}</td>
                    <td>{{exam.course_id}}</td>
                    <td>{{exam.created_at | myDate}}</td>
                    <td>
                        <a href="#" @click="editModal(exam)" class="text-primary"><i
                                class="fa fa-edit fa-lg c-info"></i></a>
                        &nbsp;&nbsp;
                        <a href="#" @click="deleteExam(exam.id)" class="text-danger"><i
                                class="fa fa-trash fa-lg c-danger"></i></a>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- start modal  -->

        <!-- Modal -->
        <div class="modal fade" id="addexam" tabindex="-1" role="dialog" aria-labelledby="addprofileTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-show="!editmode" class="modal-title" id="addexamTitle">Add New Exam</h5>
                        <h5 v-show="editmode" class="modal-title" id="addexamTitle">Update Exam Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editmode?updateExam():creatExam()">
                        <div class="modal-body">
                            <div class="form-group">
                                <input v-model="form.name" type="text" name="name" placeholder="name"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('name') }">
                                <has-error :form="form" field="name"></has-error>
                            </div>
                            <div class="form-group">
                                <input v-model="form.result" type="number" name="result"
                                    placeholder="result" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('result') }">
                                <has-error :form="form" field="result"></has-error>
                            </div>
                            <div class="form-group">
                                <input v-model="form.passing" type="number" name="passing"
                                    placeholder="passing" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('passing') }">
                                <has-error :form="form" field="passing"></has-error>
                            </div>
                            <div class="form-group">
                                <select v-model="form.course_id" name="course_id" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('course_id') }">
                                    <option v-for="course in courses" :key="course.id" :value="course.id">{{course.name}}</option>
                                </select>
                                <has-error :form="form" field="exam_id"></has-error>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button v-show="editmode" type="submit" class="btn btn-success">Update Exam</button>
                            <button v-show="!editmode" type="submit" class="btn btn-primary">Add Exam</button>
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
                courses: {},
                exams: {},
                form: new Form({
                    id: '',
                    name: '',
                    result: '',
                    passing: '',
                    course_id: ''
                }),
            }
        },
        methods: {
            newModal() {
                this.editmode = false;
                this.form.reset();
                $('#addexam').modal('show');
            },
            editModal(exam) {
                this.editmode = true;
                this.form.reset();
                this.form.fill(exam);
                $('#addexam').modal('show');
            },
            loadExam() {
                axios.get('/manage/show-exams').then(({
                    data
                }) => {
                    this.exams = data
                });
                axios.get('/manage/show-courses').then(({
                    data
                }) => {
                    this.courses = data
                });
            },
            updateExam() {
                this.$Progress.start();
                this.form.put('/manage/exams/' + this.form.id)
                    .then(() => {
                        this.loadExam();
                        $('#addexam').modal('hide');
                        this.$Progress.finish();
                        swal.fire(
                            'Updated!',
                            'Your Exam has been updated.',
                            'success'
                        );
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your Exam has been problem.',
                            'error'
                        );
                    });
            },
            creatExam() {
                this.$Progress.start();
                this.form.post('/manage/exams')
                    .then(() => {
                        this.loadExam();
                        $('#addexam').modal('hide');
                        this.$Progress.finish();
                        toast.fire({
                            type: 'success',
                            title: 'Created Exam successfully'
                        });
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your Exam has been problem.',
                            'error'
                        );
                    });
            },
            deleteExam(id) {
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
                                    url: '/manage/exams/' + id,
                                })
                                .then(() => {
                                    this.$Progress.finish();
                                    swal.fire(
                                        'Deleted!',
                                        'Your Exam has been deleted.',
                                        'success'
                                    );
                                    this.loadExam();
                                })
                                .catch(() => {
                                    swal.fire(
                                        'oops!',
                                        'Your Exam has been oops.',
                                        'error'
                                    );
                                });
                        }
                    })
                    .catch(() => {})
            }
        },
        created() {
            this.loadExam();
        }
    }

</script>