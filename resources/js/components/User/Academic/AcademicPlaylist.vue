<template>
      <div class="play-list">
        <div class="play-list-over-lay">
            <div class="container">
                <div class="content">
                    <div class="row">

                        <div class="vedio col-lg-8">
                            <div v-for="active in ActiveLesson" :key="active.id">
                                <youtube :video-id="active.url"></youtube>
                                <h3>{{active.name}}</h3>
                                <button @click.prevent="WatchLater(active.id)" class="btn btn-dark btn-lg"><i class="fas fa-clock"></i> Watch Later</button>
                                <button @click="GoIde()" class="btn btn-dark btn-lg general_btn"><i class="fas fa-code"></i> IDE</button>
                                <div class="mb-5">
                                    <h6 style="color:white">{{active.description}}</h6>
                                </div>
                                <!-- <div v-for="attach in active.attachs" :key="attach.id">
                                    <h3>{{attach.name}} {{attach.url}}</h3>
                                </div> -->
                            </div>                   
                        </div>
                        
                        <div class="play-list-part col-lg-4">
                            <div class="list-group">
                                <!-- <router-link :to="'/playlist/course/'+courseID+'/lesson/'+lesson.id" v-for="lesson in playlist" :key="lesson.id" class="list-group-item list-group-item-action list-group-item-dark"><i class="fab fa-youtube"></i>#{{lesson.sorting}} {{lesson.name}}</router-link> -->
                                <a @click.prevent="ShowLesson(lesson)" v-for="lesson in playlist" :key="lesson.id" class="list-group-item list-group-item-action list-group-item-dark"><i class="fab fa-youtube"></i>#{{lesson.sorting}} {{lesson.name}}</a>
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
                lessonID: this.$route.params.lid,
                courseID: this.$route.params.cid,
                playlist:{},
                ActiveLesson:{},
                Profile:"2"
            }
        },
        methods:{
            LoadLesson(){
                axios.get('/stud/course/'+this.courseID+'/lessons')
                .then(({ data }) => { this.playlist = data });
            },
            ViewLesson(){
                axios.get('/stud/course/'+this.courseID+'/lesson/'+this.lessonID)
                .then(({ data }) => { this.ActiveLesson = data });
            },
            ShowLesson(lesson){
                this.$Progress.start();
                // this.lessonID = lid;
                axios.get('/stud/course/'+this.courseID+'/lesson/'+lesson.sorting)
                .then(({ data }) => {
                    this.ActiveLesson = data 
                    this.$router.push({path: '/academic/playlist/track/'+this.trackID+'/course/'+this.courseID+'/lesson/'+lesson.sorting }) 
                });
                axios.post('/stud/add-lesson/'+lid+'/courseID/'+this.courseID+'/trackID/'+this.trackID+'/profileID/'+this.Profile);
                this.$Progress.finish();
            },
            WatchLater(lid){
                axios.post('/stud/course/watch-later/'+lid+'/profile_id/'+this.Profile)
                .then(()=>{
                    toast.fire({
                        type: 'success',
                        title: 'Added To Watch Later!'
                    });
                });
            },
            GoIde(){
                this.$Progress.start();
                this.$router.push({path: '/ideintro' }) 
                this.$Progress.finish();
            }
        },
        created(){
            this.$Progress.start();
            this.LoadLesson();
            this.ViewLesson();
            this.$Progress.finish();
            toast.fire({
                type: 'success',
                title: 'Academic playlist page'
            });
        }
    }
</script>