<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;
use DB;

use App\User;
use App\Exam;
use App\Question;

class ExamController extends Controller
{
    public function AcademicShowExam($tid, $cid, $eid)
    {
        $tid = $tid;
        $cid = $cid;
        $examid = $eid;
        $questions = Question::where('exam_id', '=', $eid)->get();
        return view('components.User.Academic.AcademicShowQuestion', compact('tid'))->with('cid', $cid)->with('examid', $eid)->withQuestions($questions);
    }

    public function exams()
    {
        $exams = Exam::paginate(4);
        return $exams;
    }
    public function showexam($eid, $cid)
    {
        $questions = Question::where('exam_id', '=', $eid)->get();
        return view('components.User.Exam.showquestion', compact('cid'))
            ->with('examid', $eid)
            ->withQuestions($questions);
    }

    public function showresult(Request $request, $pid)
    {
        $user_id = Auth::user()->id;
        $user = User::findOrFail($user_id);

        $exam_id = $request->examid;
        $exam = Exam::findOrFail($exam_id);

        $question = Question::where('exam_id', '=', $exam_id)->get();
        $count = count($question) + 1;

        //user answers
        $check = array();
        for ($i = 1; $i < $count; $i++) {
            $check['quest' . $i] =  $request->input('question' . $i);
        }

        // //uans
        $uans = array();
        foreach ($check as $ans) {
            array_push($uans, $ans);
        }

        //correct answers
        $answers = array();
        foreach ($question as $q) {
            array_push($answers, $q->answer);
            $exam_result = $q->exams->result;
        }

        $quest_count = count($answers);
        $question_mark = $exam_result / $quest_count;

        $score = 0;
        for ($x = 0; $x < $quest_count; $x++) {
            if ($answers[$x] == $uans[$x]) {
                $score = $score + $question_mark;
            }
        }

        if ($pid == 1) {

            $user->exams()->attach($exam_id, ['score' => $score, 'profile_id' => $pid]);

            if ($score >= $exam->passing) {

                $achivmentID = DB::table('achivment')
                    ->join('course', 'course.id', '=', 'achivment.course_id')
                    ->where('course.id', $request->cid)
                    ->select('achivment.id')
                    ->get();

                $achiv = array();
                foreach ($achivmentID as $aid) {
                    array_push($achiv, $aid->id);
                }

                $user_achivments = DB::table('user_achivment')
                    ->join('users', 'users.id', '=', 'user_achivment.user_id')
                    ->join('achivment', 'achivment.id', '=', 'user_achivment.achivment_id')
                    ->where('users.id', $user_id)
                    ->select('user_achivment.achivment_id as id')
                    ->get();

                $ua = array();
                foreach ($user_achivments as $uas) {
                    array_push($ua, $uas->id);
                }



                if (in_array($achiv[0], $ua)) { } else {
                    DB::table('user_achivment')->insert([
                        ['user_id' => $user_id, 'achivment_id' => $achiv[0], 'created_at' => now(), 'updated_at' => now()],
                    ]);
                }
            }
            return view('components.User.Exam.resultpage')->withCheck($check)->withQuestion($question);
        } else {
            //$user->exams()->attach($exam_id, ['score'=>$score,'profile_id'=>$pid]);    
            $tid = $request->tid;
            $cid = $request->cid;
            $track_courses = DB::table('track_course')
                ->join('track', 'track.id', '=', 'track_course.track_id')
                ->join('course', 'course.id', '=', 'track_course.course_id')
                ->where('track.id', $tid)
                ->where('course.id', '>', $cid)
                ->select('track_course.course_id as id')
                ->get();
            $tc = array();
            foreach ($track_courses as $tcs) {
                array_push($tc, $tcs->id);
            }
            if (empty($tc)) {
                if ($score >= $exam->passing) {
                    $trackAchivmentID = DB::table('track_achivment')
                        ->join('track', 'track.id', '=', 'track_achivment.track_id')
                        ->where('track.id', $request->tid)
                        ->select('track_achivment.id')
                        ->get();

                    $track_achiv = array();
                    foreach ($trackAchivmentID as $taid) {
                        array_push($track_achiv, $taid->id);
                    }

                    $user_track_achivments = DB::table('user_track_achivment')
                        ->join('users', 'users.id', '=', 'user_track_achivment.user_id')
                        ->join('track_achivment', 'track_achivment.id', '=', 'user_track_achivment.track_achivment_id')
                        ->where('users.id', $user_id)
                        ->select('user_track_achivment.track_achivment_id as id')
                        ->get();

                    $utas = array();
                    foreach ($user_track_achivments as $uta) {
                        array_push($utas, $uta->id);
                    }
                    if (in_array($track_achiv[0], $utas)) { } else {

                        DB::table('user_track_achivment')->insert([
                            ['user_id' => $user_id, 'track_achivment_id' => $track_achiv[0], 'created_at' => now(), 'updated_at' => now()],
                        ]);
                    }
                }
            } else {
                $currentCourse = current($tc);
                if ($score >= $exam->passing) {
                    $user->courses()->attach($currentCourse, ['profile_id' => $pid, 'track_id' => $tid]);
                }
            }
            return view('components.User.Exam.resultpage')->withCheck($check)->withQuestion($question);
        }
    }
}
