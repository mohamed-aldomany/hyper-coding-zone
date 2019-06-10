<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Passport\HasApiTokens;
class Article extends Model
{
    protected $table ='article';

    protected $fillable = [
        'title', 'body', 'user_id', 'track_id'
    ];

    public function tracks(){
        return $this->belongsTo('App\Track','track_id','id');
    }

    public function users(){
        return $this->belongsTo('App\User','user_id','id');
    }
    
    public function comments(){
        return $this->hasMany('App\Comment');
    }
}
