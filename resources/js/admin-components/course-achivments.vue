<template>
    <div>
        <!-- <router-link to="/profile">profile</router-link> -->
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">title</th>
                    <th scope="col">description</th>
                    <th scope="col">course_id</th>
                    <th scope="col">Created at</th>
                    <th scope="col">
                        <button type="button" class="btn btn-primary" @click="newModal">
                            Add New Course Achivment
                        </button>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="achivment in achivments" :key="achivment.id">
                    <th scope="row">{{achivment.id}}</th>
                    <td>{{achivment.title}}</td>
                    <td>{{achivment.description.substring(0,90)+"...."}}</td>
                    <td>{{achivment.course_id}}</td>
                    <td>{{achivment.created_at | myDate}}</td>
                    <td>
                        <a href="#" @click="editModal(achivment)" class="text-primary"><i
                                class="fa fa-edit fa-lg c-info"></i></a>
                        &nbsp;&nbsp;
                        <a href="#" @click="deleteAchivment(achivment.id)" class="text-danger"><i
                                class="fa fa-trash fa-lg c-danger"></i></a>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- start modal  -->

        <!-- Modal -->
        <div class="modal fade" id="addachivment" tabindex="-1" role="dialog" aria-labelledby="addprofileTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-show="!editmode" class="modal-title" id="addachivmentTitle">Add New Achivment</h5>
                        <h5 v-show="editmode" class="modal-title" id="addachivmentTitle">Update Achivment Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editmode?updateAchivment():creatAchivment()">
                        <div class="modal-body">
                            <div class="form-group">
                                <input v-model="form.title" type="text" title="title" placeholder="title"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('title') }">
                                <has-error :form="form" field="title"></has-error>
                            </div>
                            <div class="form-group">
                                <input v-model="form.description" type="text" name="description" placeholder="description"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('description') }">
                                <has-error :form="form" field="description"></has-error>
                            </div>
                            <div class="form-group">
                                <select v-model="form.course_id" name="course_id" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('course_id') }">
                                    <option v-for="course in courses" :key="course.id" :value="course.id">{{course.name}}
                                    </option>
                                </select>
                                <has-error :form="form" field="course_id"></has-error>
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
                achivments: {},
                form: new Form({
                    id: '',
                    title: '',
                    description: '',
                    course_id: '',
                }),
            }
        },
        methods: {
            newModal() {
                this.editmode = false;
                this.form.reset();
                $('#addachivment').modal('show');
            },
            editModal(achivment) {
                this.editmode = true;
                this.form.reset();
                this.form.fill(achivment);
                $('#addachivment').modal('show');
            },
            loadAchivments() {
                axios.get('/manage/show-achivments').then(({
                    data
                }) => {
                    this.achivments = data
                });
                axios.get('/manage/show-courses').then(({
                    data
                }) => {
                    this.courses = data
                });
            },
            updateAchivment() {
                this.$Progress.start();
                this.form.put('/manage/course_achivments/' + this.form.id)
                    .then(() => {
                        this.loadAchivments();
                        $('#addachivment').modal('hide');
                        this.$Progress.finish();
                        swal.fire(
                            'Updated!',
                            'Your Achivments has been updated.',
                            'success'
                        );
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your Achivments has been problem.',
                            'error'
                        );
                    });
            },
            creatAchivment() {
                this.$Progress.start();
                this.form.post('/manage/course_achivments')
                    .then(() => {
                        this.loadAchivments();
                        $('#addachivment').modal('hide');
                        this.$Progress.finish();
                        toast.fire({
                            type: 'success',
                            title: 'Created Achivments successfully'
                        });
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your Achivments has been problem.',
                            'error'
                        );
                    });
            },
            deleteAchivment(id) {
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
                                    url: '/manage/course_achivments/' + id,
                                })
                                .then(() => {
                                    this.$Progress.finish();
                                    swal.fire(
                                        'Deleted!',
                                        'Your Achivments has been deleted.',
                                        'success'
                                    );
                                    this.loadAchivments();
                                })
                                .catch(() => {
                                    swal.fire(
                                        'oops!',
                                        'Your Achivments has been oops.',
                                        'error'
                                    );
                                });
                        }
                    })
                    .catch(() => {})
            }
        },
        created() {
            this.loadAchivments();
        }
    }

</script>
