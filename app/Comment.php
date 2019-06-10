<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Passport\HasApiTokens;
class Comment extends Model
{
    protected $table ='comment';

    protected $fillable = [
        'comment', 'user_id', 'article_id'
    ];

    public function articles(){
        return $this->belongsTo('App\Article','article_id','id');
    }

    public function users(){
        return $this->belongsTo('App\User','user_id','id');
    }

    public function replies(){
        return $this->hasMany('App\Reply');
    }
}