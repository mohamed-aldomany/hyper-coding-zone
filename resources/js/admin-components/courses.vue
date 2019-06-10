<template>
    <div>
        <!-- <router-link to="/profile">profile</router-link> -->
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Description</th>
                    <th scope="col">lessons</th>
                    <th scope="col">level</th>
                    <th scope="col">Sorting</th>
                    <th scope="col">exam</th>
                    <th scope="col">Created at</th>
                    <th scope="col">
                        <button type="button" class="btn btn-primary" @click="newModal">
                            Add New Course
                        </button>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="course in courses" :key="course.id">
                    <th scope="row">{{course.id}}</th>
                    <td>{{course.name}}</td>
                    <td>{{course.description.substring(0,90)+"...."}}</td>
                    <td>{{course.no_lessons}}</td>
                    <td>{{course.level}}</td>
                    <td>{{course.sorting}}</td>
                    <td>{{course.exam_id}}</td>
                    <td>{{course.created_at | myDate}}</td>
                    <td>
                        <a href="#" @click="editModal(course)" class="text-primary"><i
                                class="fa fa-edit fa-lg c-info"></i></a>
                        &nbsp;&nbsp;
                        <a href="#" @click="deleteCourse(course.id)" class="text-danger"><i
                                class="fa fa-trash fa-lg c-danger"></i></a>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- start modal  -->

        <!-- Modal -->
        <div class="modal fade" id="addcourse" tabindex="-1" role="dialog" aria-labelledby="addprofileTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-show="!editmode" class="modal-title" id="addcourseTitle">Add New Course</h5>
                        <h5 v-show="editmode" class="modal-title" id="addcourseTitle">Update Course Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editmode?updateCourse():creatCourse()">
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
                                <input v-model="form.no_lessons" type="number" name="no_lessons"
                                    placeholder="no_lessons" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('no_lessons') }">
                                <has-error :form="form" field="no_lessons"></has-error>
                            </div>
                            <div class="form-group">
                                <input v-model="form.level" type="text" name="level"
                                    placeholder="level" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('level') }">
                                <has-error :form="form" field="level"></has-error>
                            </div>
                            <div class="form-group">
                                <input v-model="form.sorting" type="number" name="sorting"
                                    placeholder="sorting" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('sorting') }">
                                <has-error :form="form" field="sorting"></has-error>
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
                            <button v-show="editmode" type="submit" class="btn btn-success">Update Course</button>
                            <button v-show="!editmode" type="submit" class="btn btn-primary">Add Course</button>
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
                    description: '',
                    no_lessons: '',
                    level: '',
                    sorting: '',
                    exam_id: ''
                }),
            }
        },
        methods: {
            newModal() {
                this.editmode = false;
                this.form.reset();
                $('#addcourse').modal('show');
            },
            editModal(course) {
                this.editmode = true;
                this.form.reset();
                this.form.fill(course);
                $('#addcourse').modal('show');
            },
            loadCourse() {
                axios.get('/manage/show-courses').then(({data}) => {this.courses = data});
                axios.get('/manage/show-exams').then(({data}) => {this.exams = data});
            },
            updateCourse() {
                this.$Progress.start();
                this.form.put('/manage/courses/'+this.form.id)
                    .then(() => {
                        this.loadCourse();
                        $('#addcourse').modal('hide');
                        this.$Progress.finish();
                        swal.fire(
                            'Updated!',
                            'Your Course has been updated.',
                            'success'
                        );
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your Course has been problem.',
                            'error'
                        );
                    });
            },
            creatCourse() {
                this.$Progress.start();
                this.form.post('/manage/courses')
                    .then(() => {
                        this.loadCourse();
                        $('#addcourse').modal('hide');
                        this.$Progress.finish();
                        toast.fire({
                            type: 'success',
                            title: 'Created Course successfully'
                        });
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your Course has been problem.',
                            'error'
                        );
                    });
            },
            deleteCourse(id) {
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
                                    url: '/manage/courses/'+id,
                                })
                                .then(() => {
                                    this.$Progress.finish();
                                    swal.fire(
                                        'Deleted!',
                                        'Your Course has been deleted.',
                                        'success'
                                    );
                                    this.loadCourse();
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
            this.loadCourse();
        }
    }

</script>
