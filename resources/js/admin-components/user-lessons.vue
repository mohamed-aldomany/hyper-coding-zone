<template>
    <div>
        <!-- <router-link to="/profile">profile</router-link> -->
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">user_id</th>
                    <th scope="col">lesson_id</th>
                    <th scope="col">course_id</th>
                    <th scope="col">track_id</th>
                    <th scope="col">profile_id</th>
                    <th scope="col">
                        <button type="button" class="btn btn-primary" @click="newModal">
                            Add New Lesson to User
                        </button>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="user_lesson in user_lessons" :key="user_lesson.id">
                    <th scope="row">{{user_lesson.id}}</th>
                    <td>{{user_lesson.user_id}}</td>
                    <td>{{user_lesson.lesson_id}}</td>
                    <td>{{user_lesson.course_id}}</td>
                    <td>{{user_lesson.track_id}}</td>
                    <td>{{user_lesson.profile_id}}</td>
                    <td>
                        <a href="#" @click="editModal(user_lesson)" class="text-primary"><i
                                class="fa fa-edit fa-lg c-info"></i></a>
                        &nbsp;&nbsp;
                        <a href="#" @click="deleteUser_Lesson(user_lesson.id)" class="text-danger"><i
                                class="fa fa-trash fa-lg c-danger"></i></a>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- start modal  -->

        <!-- Modal -->
        <div class="modal fade" id="adduserlessons" tabindex="-1" role="dialog" aria-labelledby="addprofileTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-show="!editmode" class="modal-title" id="adduserlessonsTitle">Add New Lesson to User</h5>
                        <h5 v-show="editmode" class="modal-title" id="adduserlessonsTitle">Update Lesson to User</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editmode?updateUserLesson():creatUserLesson()">
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
                                <select v-model="form.lesson_id" name="lesson_id" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('lesson_id') }">
                                    <option v-for="lesson in lessons" :key="lesson.id" :value="lesson.id">
                                        {{lesson.name}}
                                    </option>
                                </select>
                                <has-error :form="form" field="lesson_id"></has-error>
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
                lessons: {},
                courses: {},
                user_lessons: {},
                form: new Form({
                    id: '',
                    user_id: '',
                    lesson_id: '',
                    course_id: '',
                    track_id: '',
                    profile_id: '',
                }),
            }
        },
        methods: {
            newModal() {
                this.editmode = false;
                this.form.reset();
                $('#adduserlessons').modal('show');
            },
            editModal(user_lesson) {
                this.editmode = true;
                this.form.reset();
                this.form.fill(user_lesson);
                $('#adduserlessons').modal('show');
            },
            loadUserLessons() {
                axios.get('/manage/show-user_lessons').then(({
                    data
                }) => {
                    this.user_lessons = data
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
            updateUserLesson() {
                this.$Progress.start();
                this.form.put('/manage/user_lessons/' + this.form.id)
                    .then(() => {
                        this.loadUserLessons();
                        $('#adduserlessons').modal('hide');
                        this.$Progress.finish();
                        swal.fire(
                            'Updated!',
                            'Your User Lessons has been updated.',
                            'success'
                        );
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your User Lessons has been problem.',
                            'error'
                        );
                    });
            },
            creatUserLesson() {
                this.$Progress.start();
                this.form.post('/manage/user_lessons')
                    .then(() => {
                        this.loadUserLessons();
                        $('#adduserlessons').modal('hide');
                        this.$Progress.finish();
                        toast.fire({
                            type: 'success',
                            title: 'Created User Lessons successfully'
                        });
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your User Lessons has been problem.',
                            'error'
                        );
                    });
            },
           deleteUser_Lesson(id) {
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
                                    url: '/manage/user_lessons/' + id,
                                })
                                .then(() => {
                                    this.$Progress.finish();
                                    swal.fire(
                                        'Deleted!',
                                        'Your User Lessons has been deleted.',
                                        'success'
                                    );
                                    this.loadUserLessons();
                                })
                                .catch(() => {
                                    swal.fire(
                                        'oops!',
                                        'Your User Lessons has been oops.',
                                        'error'
                                    );
                                });
                        }
                    })
                    .catch(() => {})
            }
        },
        created() {
            this.loadUserLessons();
        }
    }

</script>
