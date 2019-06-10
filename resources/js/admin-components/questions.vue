<template>
    <div>
        <!-- <router-link to="/profile">profile</router-link> -->
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">question_no</th>
                    <th scope="col">question</th>
                    <th scope="col">answer</th>
                    <th scope="col">Exam</th>
                    <th scope="col">Created at</th>
                    <th scope="col">
                        <button type="button" class="btn btn-primary" @click="newModal">
                            Add New Question
                        </button>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="question in questions" :key="question.id">
                    <th scope="row">{{question.id}}</th>
                    <td>{{question.question_no}}</td>
                    <td>{{question.question}}</td>
                    <td>{{question.answer}}</td>
                    <td>{{question.exam_id}}</td>
                    <td>{{question.created_at | myDate}}</td>
                    <td>
                        <a href="#" @click="editModal(question)" class="text-primary"><i
                                class="fa fa-edit fa-lg c-info"></i></a>
                        &nbsp;&nbsp;
                        <a href="#" @click="deleteQuestion(question.id)" class="text-danger"><i
                                class="fa fa-trash fa-lg c-danger"></i></a>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- start modal  -->

        <!-- Modal -->
        <div class="modal fade" id="addquestion" tabindex="-1" role="dialog" aria-labelledby="addprofileTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-show="!editmode" class="modal-title" id="addquestionTitle">Add New Question</h5>
                        <h5 v-show="editmode" class="modal-title" id="addquestionTitle">Update Question Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editmode?updateQuestion():creatQuestion()">
                        <div class="modal-body">
                            <div class="form-group">
                                <input v-model="form.question_no" type="number" name="question_no" placeholder="question_no"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('question_no') }">
                                <has-error :form="form" field="question_no"></has-error>
                            </div>
                            <div class="form-group">
                                <input v-model="form.question" type="text" name="question"
                                    placeholder="question" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('question') }">
                                <has-error :form="form" field="question"></has-error>
                            </div>
                            <div class="form-group">
                                <input v-model="form.choise1" type="text" name="choise1"
                                    placeholder="choise1" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('choise1') }">
                                <has-error :form="form" field="choise1"></has-error>
                            </div>
                            <div class="form-group">
                                <input v-model="form.choise2" type="text" name="choise2"
                                    placeholder="choise2" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('choise2') }">
                                <has-error :form="form" field="choise2"></has-error>
                            </div>
                            <div class="form-group">
                                <input v-model="form.choise3" type="text" name="choise3"
                                    placeholder="choise3" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('choise3') }">
                                <has-error :form="form" field="choise3"></has-error>
                            </div>
                            <div class="form-group">
                                <input v-model="form.answer" type="text" name="answer"
                                    placeholder="answer" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('answer') }">
                                <has-error :form="form" field="answer"></has-error>
                            </div>
                            <div class="form-group">
                                <select v-model="form.exam_id" name="exam_id" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('exam_id') }">
                                    <option v-for="exam in exams" :key="exam.id" :value="exam.id">{{exam.name}}</option>
                                </select>
                                <has-error :form="form" field="exam_id"></has-error>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button v-show="editmode" type="submit" class="btn btn-success">Update Question</button>
                            <button v-show="!editmode" type="submit" class="btn btn-primary">Add Question</button>
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
                exams: {},
                questions: {},
                form: new Form({
                    id: '',
                    question_no:'',
                    question: '',
                    choise1: '',
                    choise2: '',
                    choise3: '',
                    answer: '',
                    exam_id: ''
                }),
            }
        },
        methods: {
            newModal() {
                this.editmode = false;
                this.form.reset();
                $('#addquestion').modal('show');
            },
            editModal(question) {
                this.editmode = true;
                this.form.reset();
                this.form.fill(question);
                $('#addquestion').modal('show');
            },
            loadQuestion() {
                axios.get('/manage/show-exams').then(({
                    data
                }) => {
                    this.exams = data
                });
                axios.get('/manage/show-questions').then(({
                    data
                }) => {
                    this.questions = data
                });
            },
            updateQuestion() {
                this.$Progress.start();
                this.form.put('/manage/questions/' + this.form.id)
                    .then(() => {
                        this.loadQuestion();
                        $('#addquestion').modal('hide');
                        this.$Progress.finish();
                        swal.fire(
                            'Updated!',
                            'Your Question has been updated.',
                            'success'
                        );
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your Question has been problem.',
                            'error'
                        );
                    });
            },
            creatQuestion() {
                this.$Progress.start();
                this.form.post('/manage/questions')
                    .then(() => {
                        this.loadQuestion();
                        $('#addquestion').modal('hide');
                        this.$Progress.finish();
                        toast.fire({
                            type: 'success',
                            title: 'Created Question successfully'
                        });
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your Question has been problem.',
                            'error'
                        );
                    });
            },
            deleteQuestion(id) {
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
                                    url: '/manage/questions/' + id,
                                })
                                .then(() => {
                                    this.$Progress.finish();
                                    swal.fire(
                                        'Deleted!',
                                        'Your Question has been deleted.',
                                        'success'
                                    );
                                    this.loadQuestion();
                                })
                                .catch(() => {
                                    swal.fire(
                                        'oops!',
                                        'Your Question has been oops.',
                                        'error'
                                    );
                                });
                        }
                    })
                    .catch(() => {})
            }
        },
        created() {
            this.loadQuestion();
        }
    }

</script>