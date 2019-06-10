<template>
    
</template>

<script>
    export default {
        data(){
            return{
                achivmentID : this.$route.params.aid,
                achiv:{}
            }
        },
        methods:{
            AchivmentDetails(){
                axios.get('/stud/profile/achiv/'+this.achivmentID)
                .then(({ data }) => { this.achiv = data });
            }
        },
        created(){
            this.AchivmentDetails();
        }
    }
</script>
