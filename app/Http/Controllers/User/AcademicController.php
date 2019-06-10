<?php

namespace App\Http\Controllers\User;

// use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;
use DB;

use App\User;
use App\Lesson;
use App\Track;
use App\Profile;

class AcademicController extends Controller
{

    //return all tracks
    public function Tracks()
    {
        return Track::all();
    }
    //return all tracks ID for the active user
    public function EnrolledTracks()
    {
        $userid = Auth::user()->id;

        return DB::table('users')
            ->join('user_track', 'users.id', '=', 'user_track.user_id')
            ->join('track', 'track.id', '=', 'user_track.track_id')
            ->where('users.id', $userid)
            ->select('track.id')
            ->get();
    }
    // user want to enroll to a track
    public function EnrollTrack($tid, $pid)
    {
        $userid = Auth::user()->id;
        $track = Track::findOrFail($tid);
        $user = User::findOrFail($userid);
        $profile = Profile::findOrFail($pid);

        //return all profiles that the user take
        $user_profile = DB::table('users')
            ->join('user_profile', 'users.id', '=', 'user_profile.user_id')
            ->join('profile', 'profile.id', '=', 'user_profile.profile_id')
            ->where('users.id', $userid)
            ->where('profile.id', $pid)
            ->select('profile.id')
            ->get();

        $upa = array();
        foreach ($user_profile as $up) {
            array_push($upa, $up->id);
        }

        if (in_array($pid, $upa)) { } else {
            $user->profiles()->attach($profile);
        }
        //return all tracks that user take
        $user_track = DB::table('users')
            ->join('user_track', 'users.id', '=', 'user_track.user_id')
            ->join('track', 'track.id', '=', 'user_track.track_id')
            ->join('profile', 'profile.id', '=', 'user_track.profile_id')
            ->where('users.id', $userid)
            ->where('track.id', $tid)
            ->where('profile.id', $pid)
            ->select('track.id')
            ->get();

        $uta = array();
        foreach ($user_track as $ut) {
            array_push($uta, $ut->id);
        }

        if (in_array($tid, $uta)) { } else {
            $first_course = DB::table('track')
                ->join('track_course', 'track.id', '=', 'track_course.track_id')
                ->join('course', 'course.id', '=', 'track_course.course_id')
                ->where('track.id', $tid)
                ->min('course.id');

            $lesson = Lesson::where('course_id', '=', $first_course)->min('id');

            $user->lessons()->attach($lesson, ['course_id' => $first_course, 'track_id' => $tid, 'profile_id' => $pid]);
            $user->courses()->attach($first_course, ['profile_id' => $pid, 'track_id' => $tid, 'latest_lesson_id' => $lesson, 'course_progress' => $lesson]);
            $user->tracks()->attach($track, ['profile_id' => $pid]);
        }
    }
    // return the courses of the specific track
    public function TrackCourses($tid)
    {
        return DB::table('track')
            ->join('track_course', 'track.id', '=', 'track_course.track_id')
            ->join('course', 'course.id', '=', 'track_course.course_id')
            ->where('track.id', '=', $tid)
            ->select('course.*')
            ->get();
    }
}