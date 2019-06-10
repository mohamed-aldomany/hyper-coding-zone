<template>
    <div class="container">
        <div class="row">
            <div class="col-md-4 mb-5 mt-5" v-for="course in courses" :key="course.id">
                <div class="card" style="box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);">
                    <img :src="'/Image/course/'+course.course_img+'.png'" alt="Card image cap" class="card-img">
                    <div class="card-body">
                        <h5 class="card-title">{{course.name|capitalize}} Course</h5>
                        <p class="card-text"><small class="text-muted">Created at {{course.created_at|myDate}}</small></p>
                        <div class="ml-2" v-if="element.includes(course.id)">
                            <a class="btn btn-danger" :href="'/stud/academic/track/'+trackID+'/course/'+course.id+'/exam/'+course.exam_id">Take {{course.examname}} Exam</a>
                            <button @click.prevent="CourseInfo(course)" class="btn btn-dark">course info</button><hr>
                            <router-link :to="'/academic/playlist/track/'+trackID+'/course/'+course.id+'/lesson/1'" class="btn btn-dark btn-block">Play Lesson</router-link>
                        </div>
                        <div v-else>
                            <div>
                                <i>you can take the exam of latest course to access this lessons</i>
                            </div>
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
                trackID: this.$route.params.tid,
                courses:{},
                element:[],
                Profile:"2"
            }
        },
        methods:{
            LoadCourses(){
                axios.get('/stud/academic/track-courses/'+this.trackID)
                .then(({ data }) => {
                    this.courses = data       
                });
                
                axios.get('/stud/enrolled-courses/'+this.trackID+'/profileID/'+this.Profile)
                .then(({ data }) => {
                    data.forEach(element=>{
                        this.element.push(element.id) 
                    })
                });
            },
            CourseInfo(course){
                swal.fire({
                    title: course.name,
                    text: course.description,
                    width: 900,
                })
            }
        },
        created(){
            this.$Progress.start();
            this.LoadCourses();
            this.$Progress.finish();
            toast.fire({
                type: 'success',
                title: 'Academic Courses page'
            });
        }
    }
</script>
