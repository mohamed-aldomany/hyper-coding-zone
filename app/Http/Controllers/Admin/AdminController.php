<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

use App\User;
use App\Profile;
use App\Track;
use App\Course;
use App\Exam;
use App\Lesson;
use App\Question;
use App\Article;
use App\Comment;
use App\Reply;

class AdminController extends Controller
{
    public function users()
    {
        return User::all(); 
    }

    public function AddUsers(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|max:100|min:8',
            'email' => 'required|string|email|unique:users',
            'group_id' => 'required'
        ]);
        User::create([
            'name' => $request['name'],
            'email' => $request['email'],
            'password' => Hash::make(str_random(32)),
            'group_id' => $request['group_id'],
        ]);
    }

    public function UpdateUsers(Request $request, $id)
    {
        $user = User::find($id);
        $this->validate($request, [
            'name' => 'required|string|max:100|min:8',
            'email' => 'required|string|email|unique:users,email,' . $user->id,
            'group_id' => 'required'
        ]);
        $user->update($request->all());
    }

    public function DeleteUsers($id)
    {
        $user = User::findOrFail($id);
        $user->delete();
    }


    // ///////////////////////////////////////////////////////////////////////////

    public function profiles()
    {
        return Profile::all();
    }

    public function AddProfiles(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|max:100|min:3',
            'description' => 'required|string|min:20',
        ]);
        Profile::create([
            'name' => $request['name'],
            'description' => $request['description'],
        ]);
    }

    public function UpdateProfiles(Request $request, $id)
    {
        $profile = Profile::find($id);
        $this->validate($request, [
            'name' => 'required|string|max:100|min:3',
            'description' => 'required|string|min:20',
        ]);
        $profile->update($request->all());
    }

    public function DeleteProfiles($id)
    {
        $profile = Profile::findOrFail($id);
        $profile->delete();
    }

    // //////////////////////////////////////////////////////////////////

    public function tracks()
    {
        return Track::all();
    }

    public function AddTracks(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|max:100|min:3',
            'description' => 'required|string|min:20',
            'sorting' => 'required',
        ]);
        Track::create([
            'name' => $request['name'],
            'description' => $request['description'],
            'sorting' => $request['sorting'],
        ]);
    }

    public function UpdateTracks(Request $request, $id)
    {
        $track = Track::find($id);
        $this->validate($request, [
            'name' => 'required|string|max:100|min:3',
            'description' => 'required|string|min:20',
            'sorting' => 'required',
        ]);
        $track->update($request->all());
    }

    public function DeleteTracks($id)
    {
        $track = Track::findOrFail($id);
        $track->delete();
    }

    // ///////////////////////////////////////////////////////////////

    public function courses()
    {
        return Course::all();
    }

    public function AddCourses(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|max:100|min:3',
            'description' => 'required|string|min:20',
            'no_lessons' => 'required',
            'level' => 'required',
            'sorting' => 'required',
            'exam_id' => 'required',
        ]);
        Course::create([
            'name' => $request['name'],
            'description' => $request['description'],
            'no_lessons' => $request['no_lessons'],
            'level' => $request['level'],
            'sorting' => $request['sorting'],
            'exam_id' => $request['exam_id'],
        ]);
    }

    public function UpdateCourses(Request $request, $id)
    {
        $course = Course::find($id);
        $this->validate($request, [
            'name' => 'required|string|max:100|min:3',
            'description' => 'required|string|min:20',
            'no_lessons' => 'required',
            'level' => 'required',
            'sorting' => 'required',
            'exam_id' => 'required',
        ]);
        $course->update($request->all());
    }

    public function DeleteCourses($id)
    {
        $course = Course::findOrFail($id);
        $course->delete();
    }

    // ///////////////////////////////////////////////////////////////

    public function lessons()
    {
        return Lesson::all();
    }

    public function AddLessons(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|max:100|min:3',
            'description' => 'required|string|min:20',
            'url' => 'required',
            'duration' => 'required',
            'sorting' => 'required',
            'course_id' => 'required',
        ]);
        Lesson::create([
            'name' => $request['name'],
            'description' => $request['description'],
            'url' => $request['url'],
            'duration' => $request['duration'],
            'sorting' => $request['sorting'],
            'course_id' => $request['course_id'],
        ]);
    }

    public function UpdateLessons(Request $request, $id)
    {
        $lesson = Lesson::find($id);
        $this->validate($request, [
            'name' => 'required|string|max:100|min:3',
            'description' => 'required|string|min:20',
            'url' => 'required',
            'duration' => 'required',
            'sorting' => 'required',
            'course_id' => 'required',
        ]);
        $lesson->update($request->all());
    }

    public function DeleteLessons($id)
    {
        $lesson = Lesson::findOrFail($id);
        $lesson->delete();
    }

    // ///////////////////////////////////////////////////////////////


    public function Exams()
    {
        return Exam::all();
    }

    public function AddExams(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|max:100|min:3',
            'result' => 'required',
            'passing' => 'required',
            'course_id' => 'required',
        ]);
        Exam::create([
            'name' => $request['name'],
            'result' => $request['result'],
            'passing' => $request['passing'],
            'course_id' => $request['course_id'],
        ]);
    }

    public function UpdateExams(Request $request, $id)
    {
        $exam = Exam::find($id);
        $this->validate($request, [
            'name' => 'required|string|max:100|min:3',
            'result' => 'required',
            'passing' => 'required',
            'course_id' => 'required',
        ]);
        $exam->update($request->all());
    }

    public function DeleteExams($id)
    {
        $exam = Exam::findOrFail($id);
        $exam->delete();
    }


    // ///////////////////////////////////////////////////////////////


    public function Questions()
    {
        return Question::all();
    }

    public function AddQuestions(Request $request)
    {
        $this->validate($request, [
            'question_no' => 'required',
            'question' => 'required|min:12',
            'choise1' => 'required|min:2',
            'choise2' => 'required|min:2',
            'choise3' => 'required|min:2',
            'answer' => 'required|min:2',
            'exam_id' => 'required',
        ]);

        Question::create([
            'question_no' => $request['question_no'],
            'question' => $request['question'],
            'choise1' => $request['choise1'],
            'choise2' => $request['choise2'],
            'choise3' => $request['choise3'],
            'answer' => $request['answer'],
            'exam_id' => $request['exam_id'],
        ]);
    }

    public function UpdateQuestions(Request $request, $id)
    {
        $question = Question::find($id);
        $this->validate($request, [
            'question_no' => 'required',
            'question' => 'required|min:12',
            'choise1' => 'required|min:2',
            'choise2' => 'required|min:2',
            'choise3' => 'required|min:2',
            'answer' => 'required|min:2',
            'exam_id' => 'required',
        ]);
        
        $question->update($request->all());
    }

    public function DeleteQuestions($id)
    {
        $question = Question::findOrFail($id);
        $question->delete();
    }

    // ///////////////////////////////////////////////////////////////


    public function articles()
    {
        return Article::all();
    }

    public function AddArticles(Request $request)
    {
        $this->validate($request, [
            'title' => 'required|max:100|min:12',
            'body' => 'required|min:12',
            'user_id' => 'required',
            'track_id' => 'required',
        ]);

        Article::create([
            'title' => $request['title'],
            'body' => $request['body'],
            'user_id' => $request['user_id'],
            'track_id' => $request['track_id'],
        ]);
    }

    public function UpdateArticles(Request $request, $id)
    {
        $article = Article::find($id);
        $this->validate($request, [
            'title' => 'required|max:100|min:12',
            'body' => 'required|min:12',
            'user_id' => 'required',
            'track_id' => 'required',
        ]);

        $article->update($request->all());
    }

    public function DeleteArticles($id)
    {
        $article = Article::findOrFail($id);
        $article->delete();
    }

    // ///////////////////////////////////////////////////////////////


    public function comments()
    {
        return Comment::all();
    }

    public function AddComments(Request $request)
    {
        $this->validate($request, [
            'comment' => 'required|max:100|min:12',
            'user_id' => 'required',
            'article_id' => 'required',
        ]);

        Comment::create([
            'comment' => $request['comment'],
            'user_id' => $request['user_id'],
            'article_id' => $request['article_id'],
        ]);
    }

    public function UpdateComments(Request $request, $id)
    {
        $comment = Comment::find($id);
        $this->validate($request, [
            'comment' => 'required|max:100|min:12',
            'user_id' => 'required',
            'article_id' => 'required',
        ]);

        $comment->update($request->all());
    }

    public function DeleteComments($id)
    {
        $comment = Comment::findOrFail($id);
        $comment->delete();
    }

    // ///////////////////////////////////////////////////////////////

    public function replies()
    {
        return Reply::all();
    }

    public function AddReplies(Request $request)
    {
        $this->validate($request, [
            'reply' => 'required',
            'user_id' => 'required',
            'comment_id' => 'required',
        ]);

        Reply::create([
            'reply' => $request['reply'],
            'user_id' => $request['user_id'],
            'comment_id' => $request['comment_id'],
        ]);
    }

    public function UpdateReplies(Request $request, $id)
    {
        $reply = Reply::find($id);
        $this->validate($request, [
            'reply' => 'required',
            'user_id' => 'required',
            'comment_id' => 'required',
        ]);

        $reply->update($request->all());
    }

    public function DeleteReplies($id)
    {
        $reply = Reply::findOrFail($id);
        $reply->delete();
    }

    // ///////////////////////////////////////////////////////////////

    public function achivments()
    {
        return DB::table('achivment')
            ->select('achivment.*')
            ->get();
    }

    public function AddCourseAchivments(Request $request)
    {
        $this->validate($request, [
            'title' => 'required|min:2|max:100',
            'description' => 'required|min:20',
            'course_id' => 'required',
        ]);

        DB::table('achivment')->insert([
            ['title' => $request->title, 'description' => $request->description, 'course_id' => $request->course_id,'created_at' => now(), 'updated_at' => now()],
        ]);    
    }

    public function UpdateCourseAchivments(Request $request, $id)
    {
        $this->validate($request, [
            'title' => 'required|min:2|max:100',
            'description' => 'required|min:20',
            'course_id' => 'required',
        ]);

        DB::table('achivment')
            ->where('achivment.id', $id)
            ->update(['title' => $request->title, 'description' => $request->description, 'course_id' => $request->course_id, 'updated_at' => now()]);
    }

    public function DeleteCourseAchivments($id)
    {
        DB::table('achivment')
            ->where('achivment.id', $id)
            ->delete();
    }


    // ///////////////////////////////////////////////////////////////

    public function details()
    {
        return DB::table('details')
            ->select('details.*')
            ->get();
    }

    public function AddCourseDetails(Request $request)
    {
        $this->validate($request, [
            'detail' => 'required|min:3',
            'course_id' => 'required',
        ]);

        DB::table('details')->insert([
            ['detail' => $request->detail, 'course_id' => $request->course_id],
        ]);
    }

    public function UpdateCourseDetails(Request $request, $id)
    {
        $this->validate($request, [
            'detail' => 'required|min:3',
            'course_id' => 'required',
        ]);

        DB::table('details')
            ->where('details.id', $id)
            ->update(['detail' => $request->detail, 'course_id' => $request->course_id]);
    }

    public function DeleteCourseDetails($id)
    {
        DB::table('details')
            ->where('details.id', $id)
            ->delete();
    }

    // ///////////////////////////////////////////////////////////////

    public function TrackAchivments()
    {
        return DB::table('track_achivment')
            ->select('track_achivment.*')
            ->get();
    }

    public function AddTrackAchivments(Request $request)
    {
        $this->validate($request, [
            'title' => 'required|min:2|max:100',
            'body' => 'required|min:20',
            'track_id' => 'required',
        ]);

        DB::table('track_achivment')->insert([
            ['title' => $request->title, 'body' => $request->body, 'track_id' => $request->track_id, 'created_at' => now(), 'updated_at' => now()],
        ]);
    }

    public function UpdateTrackAchivments(Request $request, $id)
    {
        $this->validate($request, [
            'title' => 'required|min:2|max:100',
            'body' => 'required|min:20',
            'track_id' => 'required',
        ]);

        DB::table('track_achivment')
            ->where('track_achivment.id', $id)
            ->update(['title' => $request->title, 'body' => $request->body, 'track_id' => $request->track_id, 'updated_at' => now()]);
    }

    public function DeleteTrackAchivments($id)
    {
        DB::table('track_achivment')
            ->where('track_achivment.id', $id)
            ->delete();
    }


    // ///////////////////////////////////////////////////////////////

    public function suggestions()
    {
        return DB::table('suggest')
            ->select('suggest.*')
            ->get();
    }

    public function AddSuggestions(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|min:2|max:100',
            'description' => 'required|min:20',
            'user_id' => 'required',
        ]);

        DB::table('suggest')->insert([
            ['name' => $request->name, 'description' => $request->description, 'user_id' => $request->user_id, 'created_at' => now(), 'updated_at' => now()],
        ]);
    }

    public function UpdateSuggestions(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required|min:2|max:100',
            'description' => 'required|min:20',
            'user_id' => 'required',
        ]);

        DB::table('suggest')
            ->where('suggest.id', $id)
            ->update(['name' => $request->name, 'description' => $request->description, 'user_id' => $request->user_id, 'updated_at' => now()]);
    }

    public function DeleteSuggestions($id)
    {
        DB::table('suggest')
            ->where('suggest.id', $id)
            ->delete();
    }

    // ///////////////////////////////////////////////////////////////

    public function watchs()
    {
        return DB::table('watch_later')
            ->select('watch_later.*')
            ->get();
    }

    public function AddWatchs(Request $request)
    {
        $this->validate($request, [
            'user_id' => 'required',
            'lesson_id' => 'required',
            'profile_id' => 'required',
        ]);

        DB::table('watch_later')->insert([
            [ 'user_id' => $request->user_id,'lesson_id' => $request->lesson_id, 'profile_id' => $request->profile_id],
        ]);
    }

    public function UpdateWatchs(Request $request, $id)
    {
        $this->validate($request, [
            'user_id' => 'required',
            'lesson_id' => 'required',
            'profile_id' => 'required',
        ]);

        DB::table('watch_later')
            ->where( 'watch_later.id', $id)
            ->update([ 'user_id' => $request->user_id,'lesson_id' => $request->lesson_id, 'profile_id' => $request->profile_id]);
    }

    public function DeleteWatchs($id)
    {
        DB::table('watch_later')
            ->where( 'watch_later.id', $id)
            ->delete();
    }

    // ///////////////////////////////////////////////////////////////

    public function UserProfiles()
    {
        return DB::table('user_profile')
            ->select('user_profile.*')
            ->get();
    }

    public function AddUserProfiles(Request $request)
    {
        $this->validate($request, [
            'user_id' => 'required',
            'profile_id' => 'required',
        ]);

        DB::table('user_profile')->insert([
            ['user_id' => $request->user_id, 'profile_id' => $request->profile_id],
        ]);
    }

    public function UpdateUserProfiles(Request $request, $id)
    {
        $this->validate($request, [
            'user_id' => 'required',
            'profile_id' => 'required',
        ]);

        DB::table('user_profile')
            ->where('user_profile.id', $id)
            ->update(['user_id' => $request->user_id, 'profile_id' => $request->profile_id]);
    }

    public function DeleteUserProfiles($id)
    {
        DB::table('user_profile')
            ->where('user_profile.id', $id)
            ->delete();
    }


    // ///////////////////////////////////////////////////////////////

    public function UserTracks()
    {
        return DB::table('user_track')
            ->select('user_track.*')
            ->get();
    }

    public function AddUserTracks(Request $request)
    {
        $this->validate($request, [
            'user_id' => 'required',
            'track_id' => 'required',
            'profile_id' => 'required',
        ]);

        DB::table('user_track')->insert([
            ['user_id' => $request->user_id, 'track_id' => $request->track_id, 'profile_id' => $request->profile_id],
        ]);
    }

    public function UpdateUserTracks(Request $request, $id)
    {
        $this->validate($request, [
            'user_id' => 'required',
            'track_id' => 'required',
            'profile_id' => 'required',
        ]);

        DB::table('user_track')
            ->where('user_track.id', $id)
            ->update(['user_id' => $request->user_id, 'track_id' => $request->track_id, 'profile_id' => $request->profile_id]);
    }

    public function DeleteUserTracks($id)
    {
        DB::table('user_track')
            ->where('user_track.id', $id)
            ->delete();
    }


    // ///////////////////////////////////////////////////////////////

    public function UserCourses()
    {
        return DB::table('user_course')
            ->select('user_course.*')
            ->get();
    }

    public function AddUserCourses(Request $request)
    {
        $this->validate($request, [
            'user_id' => 'required',
            'course_id' => 'required',
            'profile_id' => 'required',
            'track_id' => 'required',
            'latest_lesson_id' => 'required',
            'course_progress' => 'required'
        ]);

        DB::table('user_course')->insert([
            ['user_id' => $request->user_id,'course_id'=>$request->course_id, 'profile_id' => $request->profile_id,'track_id' => $request->track_id,'latest_lesson_id'=>$request->latest_lesson_id, 'course_progress'=> $request->course_progress],
        ]);
    }

    public function UpdateUserCourses(Request $request, $id)
    {
        $this->validate($request, [
            'user_id' => 'required',
            'course_id' => 'required',
            'profile_id' => 'required',
            'track_id' => 'required',
            'latest_lesson_id' => 'required',
            'course_progress' => 'required'
        ]);

        DB::table('user_course')
            ->where('user_course.id', $id)
            ->update(['user_id' => $request->user_id,'course_id'=>$request->course_id, 'profile_id' => $request->profile_id,'track_id' => $request->track_id,'latest_lesson_id'=>$request->latest_lesson_id, 'course_progress'=> $request->course_progress ]);
    }

    public function DeleteUserCourses($id)
    {
        DB::table('user_course')
            ->where('user_course.id', $id)
            ->delete();
    }


    // ///////////////////////////////////////////////////////////////

    public function UserLessons()
    {
        return DB::table('user_lesson')
            ->select('user_lesson.*')
            ->get();
    }

    public function AddUserLessons(Request $request)
    {
        $this->validate($request, [
            'user_id' => 'required',
            'lesson_id' => 'required',
            'course_id' => 'required',
            'profile_id' => 'required',
            'track_id' => 'required',
        ]);

        DB::table('user_lesson')->insert([
            ['user_id' => $request->user_id, 'lesson_id' => $request->lesson_id, 'course_id' => $request->course_id, 'track_id' => $request->track_id, 'profile_id' => $request->profile_id],
        ]);
    }

    public function UpdateUserLessons(Request $request, $id)
    {
        $this->validate($request, [
            'user_id' => 'required',
            'lesson_id' => 'required',
            'course_id' => 'required',
            'profile_id' => 'required',
            'track_id' => 'required',
        ]);

        DB::table('user_lesson')
            ->where('user_lesson.id', $id)
            ->update(['user_id' => $request->user_id, 'lesson_id' => $request->lesson_id, 'course_id' => $request->course_id, 'track_id' => $request->track_id, 'profile_id' => $request->profile_id]);
    }

    public function DeleteUserLessons($id)
    {
        DB::table('user_lesson')
            ->where('user_lesson.id', $id)
            ->delete();
    }


    // ///////////////////////////////////////////////////////////////

    public function UserExams()
    {
        return DB::table('user_exam')
            ->select('user_exam.*')
            ->get();
    }

    public function AddUserExams(Request $request)
    {
        $this->validate($request, [
            'user_id' => 'required',
            'exam_id' => 'required',
            'profile_id' => 'required',
            'score' => 'required',
        ]);

        DB::table('user_exam')->insert([
            ['user_id' => $request->user_id, 'exam_id' => $request->exam_id, 'profile_id' => $request->profile_id, 'score' => $request->score],
        ]);
    }

    public function UpdateUserExams(Request $request, $id)
    {
        $this->validate($request, [
            'user_id' => 'required',
            'exam_id' => 'required',
            'profile_id' => 'required',
            'score' => 'required',
        ]);

        DB::table('user_exam')
            ->where('user_exam.id', $id)
            ->update(['user_id' => $request->user_id, 'exam_id' => $request->exam_id, 'profile_id' => $request-> profile_id, 'score' => $request->score]);
    }

    public function DeleteUserExams($id)
    {
        DB::table('user_exam')
            ->where('user_exam.id', $id)
            ->delete();
    }


    // ///////////////////////////////////////////////////////////////

    public function UserCourseAchivments()
    {
        return DB::table('user_achivment')
            ->select('user_achivment.*')
            ->get();
    }

    public function AddUserCourseAchivments(Request $request)
    {
        $this->validate($request, [
            'user_id' => 'required',
            'achivment_id' => 'required',
        ]);

        DB::table('user_achivment')->insert([
            ['user_id' => $request->user_id, 'achivment_id' => $request->achivment_id, 'created_at' => now(), 'updated_at' => now()],
        ]);
    }

    public function UpdateUserCourseAchivments(Request $request, $id)
    {
        $this->validate($request, [
            'user_id' => 'required',
            'achivment_id' => 'required',
        ]);

        DB::table('user_achivment')
            ->where('user_achivment.id', $id)
            ->update(['user_id' => $request->user_id, 'achivment_id' => $request-> achivment_id, 'updated_at' => now()]);
    }

    public function DeleteUserCourseAchivments($id)
    {
        DB::table('user_achivment')
            ->where('user_achivment.id', $id)
            ->delete();
    }

    // ///////////////////////////////////////////////////////////////

    public function UserTrackAchivments()
    {
        return DB::table('user_track_achivment')
            ->select('user_track_achivment.*')
            ->get();
    }

    public function AddUserTrackAchivments(Request $request)
    {
        $this->validate($request, [
            'user_id' => 'required',
            'track_achivment_id' => 'required',
        ]);

        DB::table('user_track_achivment')->insert([
            ['user_id' => $request->user_id, 'track_achivment_id' => $request->track_achivment_id, 'created_at' => now(), 'updated_at' => now()],
        ]);
    }

    public function UpdateUserTrackAchivments(Request $request, $id)
    {
        $this->validate($request, [
            'user_id' => 'required',
            'track_achivment_id' => 'required',
        ]);

        DB::table('user_track_achivment')
            ->where('user_track_achivment.id', $id)
            ->update(['user_id' => $request->user_id, 'track_achivment_id' => $request->track_achivment_id, 'updated_at' => now()]);
    }

    public function DeleteUserTrackAchivments($id)
    {
        DB::table('user_track_achivment')
            ->where('user_track_achivment.id', $id)
            ->delete();
    }
 


}