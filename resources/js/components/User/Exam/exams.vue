<template>

<div>
    <div class="backgroung_gradiant">
        <div class="container details">
            <h1 class="text-center">Exam Details</h1><br>
            <p class="lead">
                There are many exams for each exam with its own name, number of questions , success rate , final score and the exam is not limited by a certain time
            </p>
        </div>
    </div>

    <div class="row mt-4 mr-4 ml-4">
        <div class="col-md-3" v-for="exam in exams.data" :key="exam.id">
            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="card-title"><img style="max-width:50px;" :src="'/Image/exam/'+exam.name+'.png'"><strong class="ml-5">{{exam.name|capitalize}} Exam</strong></h5><hr>
                    <p class="card-text">
                        <span style="font-size:18px;">result :</span><span style="color: yellowgreen"> {{exam.result}} </span><br>
                        <span style="font-size:18px;">passing :</span> <span style="color:darkred"> {{exam.passing}} </span>
                    </p>
                    <a :href="'/stud/exam/'+exam.id+'/course/'+exam.course_id" class="btn btn-outline-secondary btn-block">Start Exam</a>
                </div>
            </div>
        </div>
    </div>
    <div class="offset-md-5">
        <pagination :data="exams" @pagination-change-page="getResults"></pagination>
    </div>
</div>

</template>

<script>
    export default {
        data() {
            return {
                exams:{}
            }
        },
        // mounted() {
    	// 	// Fetch initial results
        //     this.getResults();
        // },
        methods:{
            LoadExams(){
                axios.get('/stud/exams')
                .then(({ data })=> {
                    this.exams = data
                })      
            },
            getResults(page = 1) {
                this.$Progress.start();    
                axios.get('/stud/exams?page=' + page)
                    .then(response => {
                        this.exams = response.data;
                    });
                this.$Progress.finish();    
                    toast.fire({
                    type: 'success',
                    title: page+' exams'
                });
		    }
        },
        created(){
            this.$Progress.start();
            this.LoadExams();
            this.$Progress.finish();
            toast.fire({
                type: 'success',
                title: 'Exams Page'
            });
        }
    }
</script>
