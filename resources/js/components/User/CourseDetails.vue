<template>
    <div>
        <div class="jumbotron jumbotron-fluid" style="background-color:#29303b;color:white">
            <div class="container">
                <h1 class="display-4 text-center">{{Details.name|capitalize}} Course Details <i class="fas fa-graduation-cap"></i></h1>
            </div>
        </div>
        <div class="container">    
            <div class="row">
                <div class="col-md-8">
                    <div class="jumbotron">
                        <h1>What you'll learn in {{Details.name|capitalize}} Course <i class="fas fa-exclamation"></i></h1><br>
                        <ul style="list-style-type: none;">
                            <li v-for="info in CourseInc" :key="info.id">
                                <i class="fas fa-check-circle"></i>&nbsp;&nbsp; {{info.detail}} 
                            </li>
                        </ul>
                        <hr class="my-4">
                        <h1>Description <i class="fab fa-studiovinari"></i></h1>
                        <p>{{Details.description}}</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <img :src="'/Image/course/'+Details.course_img+'.png'" class="card-img-top" alt="Card image cap">
                        <!-- <hr> -->
                        <div class="card-body">
                            <p class="lead">number of lessons : {{no_lessons}}</p>
                            <p class="lead">level : {{Details.level}}</p><hr>
                            <router-link v-if="element.includes(courseID)" :to="'/browse/playlist/course/'+Details.id+'/lesson/1'"  class="btn btn-primary btn-block btn-lg general_btn">Contuine Course</router-link>
                            <button v-else @click.prevent="EnrollCourse(Details.id)" class="btn btn-primary btn-block btn-lg general_btn">Enroll Course</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data(){
           return{
                courseID : this.$route.params.cid,
                Details : {},   
                no_lessons:"",
                CourseInc:{},
                element: [],
                Profile:"1",
                trackID:"null"
            } 
        },
        methods:{
            CourseDetails(){
                axios.get('/stud/course-details/'+this.courseID)
                .then(({ data }) => { this.Details = data });

                axios.get('/stud/course-lessons/'+this.courseID)
                .then(({ data }) => { this.no_lessons = data });
            
                axios.get('/stud/enrolled-courses/'+this.trackID+'/profileID/'+this.Profile)
                .then(({ data }) => {
                    data.forEach(element=>{
                        this.element.push(""+element.id+"") 
                    })
                });

                axios.get('/stud/course-includes/'+this.courseID)
                .then(({ data }) => { this.CourseInc = data });
            },
            EnrollCourse(courseID){
                swal.fire({
                    title: 'this course will be saved in your profile management',
                    text: "You can be able to revert this (:",
                    type: 'success',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Accept...'
                })
                .then((result) => {
                    if (result.value) {
                        axios.post('/stud/enroll-course/'+courseID+'/profileID/'+this.Profile)
                        .then(({data})=>{
                            swal.fire({
                                position: 'top-end',
                                type: 'success',
                                title: 'Your course has been saved',
                                showConfirmButton: false,
                                timer: 1500
                            })
                            this.$router.push({path: '/browse/playlist/course/'+courseID+'/lesson/1' })
                        });
                    } 
                })
            }
        },
        created(){
            this.$Progress.start();
            this.CourseDetails();
            this.$Progress.finish();
            toast.fire({
                type: 'success',
                title: 'Course Details Page'
            });
        }
    }
</script>