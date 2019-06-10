<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Passport\HasApiTokens;
class Question extends Model
{
    protected $table ='question';

    protected $fillable = [
        'question_no', 'question', 'choise1', 'choise2', 'choise3', 'answer', 'exam_id'
    ];

    public function exams(){
        return $this->belongsTo('App\Exam','exam_id','id');
    }
}
