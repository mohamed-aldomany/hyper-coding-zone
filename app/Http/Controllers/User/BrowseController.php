<?php

namespace App\Http\Controllers\User;

// use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Auth;
use DB;

use App\Course;
use App\User;
use App\Lesson;

class BrowseController extends Controller
{
    // return all courses in "/course" link in "courses.vue"
    public function Courses()
    {
        return Course::all();
    }

    // return course details for specific course in "CourseDetails.vue"
    public function CourseDetails($cid)
    {
        return Course::findOrFail($cid);
    }

    // return total number of lessons in specific course in "CourseDetails.vue"
    public function CourseLessons($cid)
    {
        $lessons = DB::table('lesson')
            ->join('course', 'course.id', '=', 'lesson.course_id')
            ->where('course.id', $cid)
            ->count();
        
        return $lessons;
    }

    // return the what is the course includes
    public function CourseIncludes($cid)
    {
        return DB::table('course')
            ->join('details', 'details.course_id', '=', 'course.id')
            ->where('course.id', $cid)
            ->select('details.detail')
            ->get();
    }
    // return all courses ID that user take it
    public function EnrolledCourses($tid, $pid)
    {
        $userid = Auth::user()->id;
        if ($tid == "null") {
            return DB::table('users')
                ->join('user_course', 'users.id', '=', 'user_course.user_id')
                ->join('course', 'course.id', '=', 'user_course.course_id')
                ->join('profile', 'profile.id', '=', 'user_course.profile_id')
                ->where('users.id', $userid)
                ->where('profile.id', $pid)
                ->select('course.id')
                ->get();
        } else {
            return DB::table('users')
                ->join('user_course', 'users.id', '=', 'user_course.user_id')
                ->join('course', 'course.id', '=', 'user_course.course_id')
                ->join('profile', 'profile.id', '=', 'user_course.profile_id')
                ->join('track', 'track.id', '=', 'user_course.track_id')
                ->where('track.id', $tid)
                ->where('users.id', $userid)
                ->where('profile.id', $pid)
                ->select('course.id')
                ->get();
        }
    }
    // user want to enroll a specific coourse in "CourseDetails.vue"
    public function EnrollCourse($cid, $pid)
    {
        //get user details :
        $userid = Auth::user()->id;
        $user = User::findOrFail($userid);
        //get course details :
        $course = Course::findOrFail($cid);
        //get enrolled courses :        
        $user_course = DB::table('users')
            ->join('user_course', 'users.id', '=', 'user_course.user_id')
            ->join('course', 'course.id', '=', 'user_course.course_id')
            ->join('profile', 'profile.id', '=', 'user_course.profile_id')
            ->where('users.id', $userid)
            ->where('course.id', $cid)
            ->where('profile.id', $pid)
            ->select('course.id')
            ->get();
        //add enrolled courses to uca array
        $uca = array();
        foreach ($user_course as $uc) {
            array_push($uca, $uc->id);
        }
        //select the minimum lesson id in the given course :        
        $lesson = Lesson::where('course_id', '=', $cid)->min('id');
        //check if the given course id in uca array or not         
        if (in_array($cid, $uca)) { } else {
            $user->lessons()->attach($lesson, ['course_id' => $cid, 'profile_id' => $pid]);
            //get max lesson id that the user take it
            $progress = DB::table('lesson')
                ->join('user_lesson', 'lesson.id', '=', 'user_lesson.lesson_id')
                ->join('users', 'users.id', '=', 'user_lesson.user_id')
                ->join('course', 'course.id', '=', 'user_lesson.course_id')
                ->join('profile', 'profile.id', '=', 'user_lesson.profile_id')
                ->where('users.id', $userid)
                ->where('course.id', $cid)
                ->where('profile.id', $pid)
                ->count();
            // add all course record ('user_id','course_id','track_id','profile_id','latest_lesson_id','progress')
            $user->courses()->attach($course, ['profile_id' => $pid, 'latest_lesson_id' => $lesson, 'course_progress' => $progress]);
        }
    }

    // return the lessons of a specific course in "LessonsPlaylist.vue"
    public function Lessons($cid)
    {
        return Lesson::where('course_id', '=', $cid)->get();
    }
    // return lesson details with the attachments    
    public function ViewLesson($cid, $lid)
    {
        return Lesson::with('attachs')->where('course_id', '=', $cid)->where('sorting', '=', $lid)->get();
    }
    // add new lesson to user
    public function AddLesson($lid, $cid, $tid, $pid)
    {
        //get user details
        $userid = Auth::user()->id;
        $user = User::findOrFail($userid);
        //get all lessons that the user have it        
        $user_lesson = DB::table('users')
            ->join('user_lesson', 'users.id', '=', 'user_lesson.user_id')
            ->join('lesson', 'lesson.id', '=', 'user_lesson.lesson_id')
            ->join('course', 'course.id', '=', 'user_lesson.course_id')
            ->join('profile', 'profile.id', '=', 'user_lesson.profile_id')
            ->where('users.id', $userid)
            ->where('course.id', $cid)
            ->where('profile.id', $pid)
            ->select('lesson.id')
            ->get();

        $ula = array();
        foreach ($user_lesson as $ul) {
            array_push($ula, $ul->id);
        }

        if (in_array($lid, $ula)) { } else {
            if ($tid == "null") {
                $user->lessons()->attach($lid, ['course_id' => $cid, 'profile_id' => $pid]);
            } else {
                $user->lessons()->attach($lid, ['course_id' => $cid, 'track_id' => $tid, 'profile_id' => $pid]);
            }
        }

        //get max  lesson id that the user take it
        $max_lesson = DB::table('lesson')
            ->join('user_lesson', 'lesson.id', '=', 'user_lesson.lesson_id')
            ->join('users', 'users.id', '=', 'user_lesson.user_id')
            ->join('course', 'course.id', '=', 'user_lesson.course_id')
            ->join('profile', 'profile.id', '=', 'user_lesson.profile_id')
            ->where('users.id', $userid)
            ->where('course.id', $cid)
            ->where('profile.id', $pid)
            ->count();
        //add the latest lesson in the user_course table
        DB::table('lesson')
            ->join('user_course', 'lesson.id', '=', 'user_course.latest_lesson_id')
            ->join('users', 'users.id', '=', 'user_course.user_id')
            ->join('course', 'course.id', '=', 'user_course.course_id')
            ->join('profile', 'profile.id', '=', 'user_course.profile_id')
            ->where('users.id', $userid)
            ->where('course.id', $cid)
            ->where('profile.id', $pid)
            ->update(['user_course.latest_lesson_id' => $lid, 'user_course.course_progress' => $max_lesson]);
    }

    public function WatchLater($lid, $pid)
    {
        $user_id = Auth::user()->id;

        //get all lessons that the user have it        
        $watch_later = DB::table('watch_later')
            ->join('users', 'users.id', '=', 'watch_later.user_id')
            ->join('lesson', 'lesson.id', '=', 'watch_later.lesson_id')
            ->join('profile', 'profile.id', '=', 'watch_later.profile_id')
            ->where('users.id', $user_id)
            ->where('lesson.id', $lid)
            ->where('profile.id', $pid)
            ->select('lesson.id')
            ->get();

        $wl = array();
        foreach ($watch_later as $watch) {
            array_push($wl, $watch->id);
        }

        if (in_array($lid, $wl)) { } else {

            DB::table('watch_later')->insert([
                ['user_id' => $user_id, 'lesson_id' => $lid, 'profile_id' => $pid],
            ]);
        }
    }

}
