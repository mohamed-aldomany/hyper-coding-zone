<template>
    <div>
        <div class="backgroung_gradiant">
            <div class="container details">
                <h1 class="text-center display-4">Academic Part</h1>
                <p class="lead">In the part of the Academy we direct students to work on a specific part of the field of the web so that this part consists of a group of courses and the order of the courses according to the priority of each course on the other and can not open any advanced course without passing the test on the current course, the academic part consists of four partitions are web design , web develope , fullstack and mean stack.</p>
            </div>
        </div>

        <div class="container">
            <br>
            <div class="row">
                <div class="col-sm-6 mb-5" v-for="track in tracks" :key="track.id">
                    <div class="card track-card" style="background-color:darkturquoise" v-if="element.includes(track.id)">
                        <div @click="GoTrack(track.id)" class="card-body">
                            <h5 style="color:#ffffff">PATH ALREADY TAKEN</h5>
                            <h2 class="card-title" style="color:#2c614e">{{track.name}}</h2>
                            <p class="card-text"><small class="text-muted">created at {{track.created_at|myDate}}</small></p>
                        </div>
                    </div>
                    <div v-else class="card track-card">
                        <div @click="EnrollTrack(track)" class="card-body">
                            <h5 style="color:#ffffff">PATH</h5>
                            <h2 class="card-title" style="color:#fe104d">{{track.name}}</h2>
                            <p class="card-text" style="color:#efebe9 !important"><small>created at {{track.created_at|myDate}}</small></p>
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
                tracks:{},
                element:[],
                Profile:"2"
            }
        },
        methods:{
            LoadTrack(){
                axios.get('/stud/academic/tracks')
                .then((data)=> {
                    this.tracks = data.data
                })

                axios.get('/stud/academic/enrolled-tracks')
                .then(({ data }) => {
                    data.forEach(element=>{
                        this.element.push(element.id) 
                    })
                });
            },
            EnrollTrack(track){
                swal.fire({
                    title: "Description",
                    text: track.description,
                    type: 'success',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Accept...',
                })
                .then((result) => {
                    if (result.value) {
                        axios.post('/stud/academic/enroll-track/'+track.id+'/profileID/'+this.Profile)
                        .then((data)=> {
                            swal.fire({
                                position: 'top-end',
                                type: 'success',
                                title: 'Your track has been saved',
                                showConfirmButton: false,
                                timer: 1500
                            })
                            this.$router.push({path: '/academic/track/'+track.id+'/courses' })      
                        })
                    }
                })

            },
            GoTrack(trackID){
                this.$router.push({path: '/academic/track/'+trackID+'/courses' })
            }
        },
        created(){
            this.$Progress.start();
            this.LoadTrack();
            this.$Progress.finish();
            toast.fire({
                type: 'success',
                title: 'Academic page'
            });
        }
    }
</script>
