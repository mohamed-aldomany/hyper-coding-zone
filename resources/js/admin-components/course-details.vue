<template>
    <div>
        <!-- <router-link to="/profile">profile</router-link> -->
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">details</th>
                    <th scope="col">course_id</th>
                    <th scope="col">Created at</th>
                    <th scope="col">
                        <button type="button" class="btn btn-primary" @click="newModal">
                            Add New Course Details
                        </button>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="detail in details" :key="detail.id">
                    <th scope="row">{{detail.id}}</th>
                    <td>{{detail.detail.substring(0,90)+"...."}}</td>
                    <td>{{detail.course_id}}</td>
                    <td>{{detail.created_at | myDate}}</td>
                    <td>
                        <a href="#" @click="editModal(detail)" class="text-primary"><i
                                class="fa fa-edit fa-lg c-info"></i></a>
                        &nbsp;&nbsp;
                        <a href="#" @click="deleteDetail(detail.id)" class="text-danger"><i
                                class="fa fa-trash fa-lg c-danger"></i></a>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- start modal  -->

        <!-- Modal -->
        <div class="modal fade" id="adddetails" tabindex="-1" role="dialog" aria-labelledby="addprofileTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-show="!editmode" class="modal-title" id="adddetailsTitle">Add New Course Details</h5>
                        <h5 v-show="editmode" class="modal-title" id="adddetailsTitle">Update Course Details Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editmode?updateDetail():creatDetail()">
                        <div class="modal-body">
                            <div class="form-group">
                                <input v-model="form.detail" type="text" name="detail"
                                    placeholder="detail" class="form-control"
                                    :class="{ 'is-invalid': form.errors.has('detail') }">
                                <has-error :form="form" field="detail"></has-error>
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
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button v-show="editmode" type="submit" class="btn btn-success">Update Details</button>
                            <button v-show="!editmode" type="submit" class="btn btn-primary">Add Details</button>
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
                details: {},
                form: new Form({
                    id: '',
                    detail: '',
                    course_id: '',
                }),
            }
        },
        methods: {
            newModal() {
                this.editmode = false;
                this.form.reset();
                $('#adddetails').modal('show');
            },
            editModal(detail) {
                this.editmode = true;
                this.form.reset();
                this.form.fill(detail);
                $('#adddetails').modal('show');
            },
            loadDetails() {
                axios.get('/manage/show-details').then(({
                    data
                }) => {
                    this.details = data
                });
                axios.get('/manage/show-courses').then(({
                    data
                }) => {
                    this.courses = data
                });
            },
            updateDetail() {
                this.$Progress.start();
                this.form.put('/manage/course_details/' + this.form.id)
                    .then(() => {
                        this.loadDetails();
                        $('#adddetails').modal('hide');
                        this.$Progress.finish();
                        swal.fire(
                            'Updated!',
                            'Your Details has been updated.',
                            'success'
                        );
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your Details has been problem.',
                            'error'
                        );
                    });
            },
            creatDetail() {
                this.$Progress.start();
                this.form.post('/manage/course_details')
                    .then(() => {
                        this.loadDetails();
                        $('#adddetails').modal('hide');
                        this.$Progress.finish();
                        toast.fire({
                            type: 'success',
                            title: 'Created Details successfully'
                        });
                    })
                    .catch(() => {
                        swal.fire(
                            'problem!',
                            'Your Details has been problem.',
                            'error'
                        );
                    });
            },
            deleteDetail(id) {
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
                                    url: '/manage/course_details/' + id,
                                })
                                .then(() => {
                                    this.$Progress.finish();
                                    swal.fire(
                                        'Deleted!',
                                        'Your Details has been deleted.',
                                        'success'
                                    );
                                    this.loadDetails();
                                })
                                .catch(() => {
                                    swal.fire(
                                        'oops!',
                                        'Your Details has been oops.',
                                        'error'
                                    );
                                });
                        }
                    })
                    .catch(() => {})
            }
        },
        created() {
            this.loadDetails();
        }
    }

</script>
