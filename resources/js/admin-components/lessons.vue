<template>
    <div>
        <!-- <router-link to="/profile">profile</router-link> -->
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Description</th>
                    <th scope="col">Url</th>
                    <th scope="col">Duration</th>
                    <th scope="col">Sorting</th>
                    <th scope="col">Course</th>
                    <th scope="col">Created at</th>
                    <th scope="col">
                        <button type="button" class="btn btn-primary" @click="newModal">
                            Add New Lesson
                        </button>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="lesson in lessons" :key="lesson.id">
                    <th scope="row">{{lesson.id}}</th>
                    <td>{{lesson.name}}</td>
                    <td>{{lesson.description.substring(0,90)+"...."}}</td>
                    <td>{{lesson.url}}</td>
                    <td>{{lesson.duration}}</td>
                    <td>{{lesson.sorting}}</td>
                    <td>{{lesson.course_id}}</td>
                    <td>{{lesson.created_at | myDate}}</td>
                    <td>
                        <a href="#" @click="editModal(lesson)" class="text-primary"><i
                                class="fa fa-edit fa-lg c-info"></i></a>
                        &nbsp;&nbsp;
                        <a href="#" @click="deleteLesson(lesson.id)" class="text-danger"><i
                                class="fa fa-trash fa-lg c-danger"></i></a>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- start modal  -->

        <!-- Modal -->
        <div class="modal fade" id="addlesson" tabindex="-1" role="dialog" aria-labelledby="addprofileTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-show="!editmode" class="modal-title" id="addlessonTitle">Add New Lesson</h5>
                        <h5 v-show="editmode" class="modal-title" id="addlessonTitle">Update Lesson Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editmode?updateLesson():creatLesson()">
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
                                <input v-model="form.url" type="text" name="url"
                                    placeholder="url" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('url') }">
                                <has-error :form="form" field="url"></has-error>
                            </div>
                            <div class="form-group">
                                <input v-model="form.duration" type="text" name="duration" placeholder="duration"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('duration') }">
                                <has-error :form="form" field="duration"></has-error>
                            </div>
                            <div class="form-group">
                                <input v-model="form.sorting" type="number" name="sorting" placeholder="sorting"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('sorting') }">
                                <has-error :form="form" field="sorting"></has-error>
                            </div>
                            <div class="form-group">
                                <select v-model="form.course_id" name="course_id" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('course_id') }">
                                    <option v-for="course in courses" :key="course.id" :value="course.id">{{course.name}}</option>
                                </select>
                                <has-error :form="form" field="course_id"></has-error>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button v-show="editmode" type="submit" class="btn btn-success">Update Lesson</button>
                            <button v-show="!editmode" type="submit" class="btn btn-primary">Add Lesson</button>
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
                lessons: {},
                exams: {},
                courses:{},
                form: new Form({
                    id: '',
                    name: '',
                    description: '',
                    url: '',
                    duration: '',
                    sorting: '',
                    course_id: ''
                }),
            }
        },
        methods: {
            newModal() {
                this.editmode = false;
                this.form.reset();
                $('#addlesson').modal('show');
            },
            editModal(lesson) {
                this.editmode = true;
                this.form.reset();
                this.form.fill(lesson);
                $('#addlesson').modal('show');
            },
            loadLesson() {
                axios.get('/manage/show-lessons').then(({
                    data
                }) => {
                    this.lessons = data
                });
                axios.get('/manage/show-courses').then(({
                    data
                }) => {
                    this.courses = data
                });
            },
            updateLesson() {
                this.$Progress.start();
                this.form.put('/manage/lessons/' + this.form.id)
                    .then(() => {
                        this.loadLesson();
                        $('#addlesson').modal('hide');
                        this.$Progress.finish();
                        swal.fire(
                            'Updated!',
                            'Your Lesson has been updated.',
                            'success'
                        );
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your Lesson has been problem.',
                            'error'
                        );
                    });
            },
            creatLesson() {
                this.$Progress.start();
                this.form.post('/manage/lessons')
                    .then(() => {
                        this.loadLesson();
                        $('#addlesson').modal('hide');
                        this.$Progress.finish();
                        toast.fire({
                            type: 'success',
                            title: 'Created Lesson successfully'
                        });
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your Lesson has been problem.',
                            'error'
                        );
                    });
            },
            deleteLesson(id) {
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
                                    url: '/manage/lessons/' + id,
                                })
                                .then(() => {
                                    this.$Progress.finish();
                                    swal.fire(
                                        'Deleted!',
                                        'Your Lesson has been deleted.',
                                        'success'
                                    );
                                    this.loadLesson();
                                })
                                .catch(() => {
                                    swal.fire(
                                        'oops!',
                                        'Your Course has been oops.',
                                        'error'
                                    );
                                });
                        }
                    })
                    .catch(() => {})
            }
        },
        created() {
            this.loadLesson();
        }
    }

</script>
