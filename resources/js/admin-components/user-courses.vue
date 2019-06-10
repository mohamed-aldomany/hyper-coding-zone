<template>
    <div>
        <!-- <router-link to="/profile">profile</router-link> -->
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">user_id</th>
                    <th scope="col">course_id</th>
                    <th scope="col">profile_id</th>
                    <th scope="col">track_id</th>
                    <th scope="col">latest_lesson</th>
                    <th scope="col">progress</th>
                    <th scope="col">Created at</th>
                    <th scope="col">
                        <button type="button" class="btn btn-primary" @click="newModal">
                            Add New Course to User
                        </button>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="user_course in user_courses" :key="user_course.id">
                    <th scope="row">{{user_course.id}}</th>
                    <td>{{user_course.user_id}}</td>
                    <td>{{user_course.course_id}}</td>
                    <td>{{user_course.track_id}}</td>
                    <td>{{user_course.profile_id}}</td>
                    <td>{{user_course.latest_lesson_id}}</td>
                    <td>{{user_course.course_progress}}</td>
                    <td>{{user_course.created_at | myDate}}</td>
                    <td>
                        <a href="#" @click="editModal(user_course)" class="text-primary"><i
                                class="fa fa-edit fa-lg c-info"></i></a>
                        &nbsp;&nbsp;
                        <a href="#" @click="deleteUser_Course(user_course.id)" class="text-danger"><i
                                class="fa fa-trash fa-lg c-danger"></i></a>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- start modal  -->

        <!-- Modal -->
        <div class="modal fade" id="addusercourses" tabindex="-1" role="dialog" aria-labelledby="addprofileTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-show="!editmode" class="modal-title" id="addusercoursesTitle">Add New Course to User</h5>
                        <h5 v-show="editmode" class="modal-title" id="addusercoursesTitle">Update Course to User</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editmode?updateUserCourse():creatUserCourse()">
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
                                <select v-model="form.course_id" name="course_id" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('course_id') }">
                                    <option v-for="course in courses" :key="course.id" :value="course.id">
                                        {{course.name}}
                                    </option>
                                </select>
                                <has-error :form="form" field="course_id"></has-error>
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
                                <select v-model="form.track_id" name="track_id" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('track_id') }">
                                    <option v-for="track in tracks" :key="track.id" :value="track.id">
                                        {{track.name}}
                                    </option>
                                </select>
                                <has-error :form="form" field="track_id"></has-error>
                            </div>
                            <div class="form-group">
                                <select v-model="form.latest_lesson_id" name="latest_lesson_id" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('latest_lesson_id') }">
                                    <option v-for="lesson in lessons" :key="lesson.id" :value="lesson.id">
                                        {{lesson.name}}
                                    </option>
                                </select>
                                <has-error :form="form" field="latest_lesson_id"></has-error>
                            </div>
                            <div class="form-group">
                                <input v-model="form.course_progress" type="text" title="course_progress" placeholder="course_progress"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('course_progress') }">
                                <has-error :form="form" field="course_progress"></has-error>
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
                lessons: {},
                courses: {},
                user_courses: {},
                form: new Form({
                    id: '',
                    user_id: '',
                    course_id: '',
                    profile_id: '',
                    track_id: '',
                    latest_lesson_id: '',
                    course_progress: '',
                }),
            }
        },
        methods: {
            newModal() {
                this.editmode = false;
                this.form.reset();
                $('#addusercourses').modal('show');
            },
            editModal(user_course) {
                this.editmode = true;
                this.form.reset();
                this.form.fill(user_course);
                $('#addusercourses').modal('show');
            },
            loadUserCourses() {
                axios.get('/manage/show-user_courses').then(({
                    data
                }) => {
                    this.user_courses = data
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
                axios.get('/manage/show-courses').then(({
                    data
                }) => {
                    this.courses = data
                });
                axios.get('/manage/show-lessons').then(({
                    data
                }) => {
                    this.lessons = data
                });
            },
            updateUserCourse() {
                this.$Progress.start();
                this.form.put('/manage/user_courses/' + this.form.id)
                    .then(() => {
                        this.loadUserCourses();
                        $('#addusercourses').modal('hide');
                        this.$Progress.finish();
                        swal.fire(
                            'Updated!',
                            'Your User Courses has been updated.',
                            'success'
                        );
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your User Courses has been problem.',
                            'error'
                        );
                    });
            },
            creatUserCourse() {
                this.$Progress.start();
                this.form.post('/manage/user_courses')
                    .then(() => {
                        this.loadUserCourses();
                        $('#addusercourses').modal('hide');
                        this.$Progress.finish();
                        toast.fire({
                            type: 'success',
                            title: 'Created User Courses successfully'
                        });
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your User Courses has been problem.',
                            'error'
                        );
                    });
            },
           deleteUser_Course(id) {
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
                                    url: '/manage/user_courses/' + id,
                                })
                                .then(() => {
                                    this.$Progress.finish();
                                    swal.fire(
                                        'Deleted!',
                                        'Your User Courses has been deleted.',
                                        'success'
                                    );
                                    this.loadUserCourses();
                                })
                                .catch(() => {
                                    swal.fire(
                                        'oops!',
                                        'Your User Courses has been oops.',
                                        'error'
                                    );
                                });
                        }
                    })
                    .catch(() => {})
            }
        },
        created() {
            this.loadUserCourses();
        }
    }

</script>
