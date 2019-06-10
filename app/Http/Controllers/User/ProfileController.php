<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Auth;
use DB;

use App\User;
use App\Article;
use App\Suggest;

class ProfileController extends Controller
{
    //1.1 profile tab:
    // return the active user
    public function Profile()
    {
        $user_id = Auth::user()->id;
        return User::findOrFail($user_id);
    }
    public function MyExams()
    {
        $user_id = Auth::user()->id;
        return DB::table('users')
            ->join('user_exam', 'users.id', '=', 'user_exam.user_id')
            ->join('exam', 'exam.id', '=', 'user_exam.exam_id')
            ->where('users.id', $user_id)
            ->select('exam.*', 'user_exam.id as exam_id', 'user_exam.score', 'user_exam.created_at as take_exam')
            ->get();
    }
    public function ExamDelete($id)
    {
        DB::table('user_exam')
            ->where('user_exam.id', $id)
            ->delete();
    }
    public function UserPosts()
    {
        $user_id = Auth::user()->id;
        return DB::table('article')
            ->join('track', 'track.id', '=', 'article.track_id')
            ->where('article.user_id', $user_id)
            ->select('article.*', 'track.name as track')
            ->get();
    }
    public function DelCourse($cid, $id)
    {
        DB::table('user_lesson')
            ->where('user_lesson.course_id', '=', $id)
            ->where('user_lesson.profile_id', '=', 1)
            ->delete();

        DB::table('user_course')
            ->where('user_course.id', $cid)
            ->delete();
    }
    public function PostDelete($id)
    {
        $post = Article::find($id);
        $post->delete();
    }
    // update the user information
    public function UpdateInfo(Request $request)
    {
        $userid = Auth::user()->id;
        $user = User::findOrFail($userid);
        $this->validate($request, [
            'name' => 'required|string|max:100|min:8',
            'email' => 'required|string|email|unique:users,email,' . $user->id,
            'firstname' => 'nullable|string|max:100|min:2',
            'lastname' => 'nullable|string|max:100|min:2',
            'phone' => 'nullable|max:11|min:11',
        ]);
        $user->update($request->all());
    }
    //user update image
    public function UserImage(Request $request)
    {
        $userid = Auth::user()->id;
        $user = User::findOrFail($userid);
        if ($request->photo != $user->picture) {

            /* image upload to server */
            $name = time() . '.' . explode('/', explode(':', substr($request->photo, 0, strpos(
                $request->photo,
                ';'
            )))[1])[1];

            \Image::make($request->photo)->resize(300, 200)->save(public_path('Image/profile/') . $name);

            $request->merge(['photo' => $name]);

            /* delete the old image */
            $photo = public_path('Image/profile/') . $user->picture;
            if (file_exists($photo)) {
                @unlink($photo);
            }
        }
        $user->picture = $request->photo;
        $user->save();
    }
    //1.2 progress tab
    //return the courses of the active user
    public function UserCourses()
    {
        $userid = Auth::user()->id;
        $user = User::findOrFail($userid);
        //return $user->courses()->get();
        return DB::table('users')
            ->join('user_course', 'users.id', '=', 'user_course.user_id')
            ->join('profile', 'profile.id', '=', 'user_course.profile_id')
            ->join('course', 'course.id', '=', 'user_course.course_id')
            ->join('lesson', 'lesson.id', '=', 'user_course.latest_lesson_id')
            ->where('users.id', $userid)
            ->where('profile.id', 1)
            ->select('course.*', 'lesson.sorting as lesson_sorting','user_course.id as user_course_id', 'user_course.latest_lesson_id', 'user_course.course_progress')
            ->get();
    }
    // return the total number of lessons in a specific course
    public function UserLessons($cid)
    {
        $userid = Auth::user()->id;
        $user = User::findOrFail($userid);
        $uc = $user->courses()->get();
        return DB::table('users')
            ->join('user_lesson', 'users.id', '=', 'user_lesson.user_id')
            ->join('lesson', 'lesson.id', '=', 'user_lesson.lesson_id')
            ->join('course', 'course.id', '=', 'user_lesson.course_id')
            ->where('users.id', $userid)
            ->where('course.id', $cid)
            ->count();
    }

    public function GetWatch()
    {
        $user_id = Auth::user()->id;
        return DB::table('users')
            ->join('watch_later', 'users.id', '=', 'watch_later.user_id')
            ->join('lesson', 'lesson.id', '=', 'watch_later.lesson_id')
            ->join('course', 'course.id', '=', 'lesson.course_id')
            ->where('users.id', $user_id)
            ->select('lesson.*', 'course.name as CourseName', 'watch_later.id as wlID')->get();
    }

    public function DelWatch($wid)
    {
        DB::table('watch_later')
            ->where('watch_later.id', $wid)
            ->delete();
    }


    //1.3 academic tab
    //retutn the tracks of active user
    public function UserTracks()
    {
        $userid = Auth::user()->id;
        //$user = User::findOrFail($userid);
        return DB::table('users')
            ->join('user_track', 'users.id', '=', 'user_track.user_id')
            ->join('track', 'track.id', '=', 'user_track.track_id')
            ->where('users.id', $userid)
            ->select('track.*', 'user_track.id as track_id')->get();
        //return $user->tracks()->get();
    }

    public function DelTrack($tid, $id)
    {
        $userid = Auth::user()->id;

        DB::table('user_track')
            ->where('user_track.id', $tid)
            ->delete();

        DB::table('user_course')
            ->join('users', 'users.id', '=', 'user_course.user_id')
            ->join('track', 'track.id', '=', 'user_course.track_id')
            ->join('profile', 'profile.id', '=', 'user_course.profile_id')
            ->where('users.id', $userid)
            ->where('track.id', $id)
            ->where('profile.id', 2)
            ->delete();

        DB::table('user_lesson')
            ->join('users', 'users.id', '=', 'user_lesson.user_id')
            ->join('track', 'track.id', '=', 'user_lesson.track_id')
            ->join('profile', 'profile.id', '=', 'user_lesson.profile_id')
            ->where('users.id', $userid)
            ->where('track.id', $id)
            ->delete();
    }
    //Achivment tab:
    public function MyAchivments()
    {
        $userid = Auth::user()->id;
        return DB::table('user_achivment')
            ->join('users', 'users.id', '=', 'user_achivment.user_id')
            ->join('achivment', 'achivment.id', '=', 'user_achivment.achivment_id')
            ->where('users.id', $userid)
            ->select('achivment.*', 'user_achivment.id as achivment_id')->get();
    }
    public function MyTrackAchivments()
    {
        $userid = Auth::user()->id;
        return DB::table('user_track_achivment')
            ->join('users', 'users.id', '=', 'user_track_achivment.user_id')
            ->join('track_achivment', 'track_achivment.id', '=', 'user_track_achivment.track_achivment_id')
            ->where('users.id', $userid)
            ->select('track_achivment.*', 'user_track_achivment.id as track_achivment_id')->get();
    }

    //SuggestCourse tab
    public function SuggestCourse(Request $request)
    {
        $userid = Auth::user()->id;

        $this->validate($request, [
            'name' => 'required|string|max:100|min:8',
            'description' => 'required|string|min:20',
        ]);

        $suggest = new Suggest();
        $suggest->name = $request->name;
        $suggest->description = $request->description;
        $suggest->user_id = $userid;
        $suggest->save();
    }
    public function MySuggestions()
    {
        $userid = Auth::user()->id;
        return DB::table('suggest')
            ->join('users', 'suggest.user_id', '=', 'users.id')
            ->where('users.id', $userid)
            ->select('suggest.*')
            ->get();
    }
    public function DelSuggest($sid)
    {
        $suggest = Suggest::findOrFail($sid);
        $suggest->delete();
    }
    public function PrintAchiv($id)
    {
        $userid = Auth::user()->id;
        return DB::table('user_achivment')
            ->join('users', 'user_achivment.user_id', '=', 'users.id')
            ->join('achivment', 'user_achivment.achivment_id', '=', 'achivment.id')
            ->where('users.id', $userid)
            ->select('achivment.*')
            ->get();
    }
}
