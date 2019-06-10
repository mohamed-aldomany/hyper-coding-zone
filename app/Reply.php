<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Passport\HasApiTokens;
class Reply extends Model
{
    protected $table ='reply';

    protected $fillable = [
        'reply', 'user_id', 'comment_id'
    ];

    public function comments(){
        return $this->belongsTo('App\Comment','comment_id','id');
    }

    public function users(){
        return $this->belongsTo('App\User','user_id','id');
    }
}
