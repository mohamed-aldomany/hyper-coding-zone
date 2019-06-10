<?php

//MainPage
    Route::get('/', function () {
        if(isset(Auth::user()->group_id)){
            return redirect('/Home');    
        }else{
            return view('welcome');
        }
    });
// end MainPage

// authenticate part: 
    //default authenticate routes:
    Auth::routes(['verify'=>true]);
    //facebook authenticate routes:
    Route::get('login/facebook', 'Auth\LoginController@FacebookRedirectToProvider');
    Route::get('login/facebook/callback', 'Auth\LoginController@FacebookHandleProviderCallback');
    //google authenticate routes:
    Route::get('login/google', 'Auth\LoginController@GoogleRedirectToProvider');
    Route::get('auth/google/callback', 'Auth\LoginController@GoogleHandleProviderCallback');
// end authentication part

//HOMEPAGE CONTAIN ALL VUE FILES  
    Route::get('/Home', 'HomeController@index')->middleware('verified');
// end HOMEPAGE

// user routes

    Route::group(['prefix'=>'stud','middleware'=>['auth', 'verified']], function(){

    //Active User        
        Route::get('/User/ActiveUser', 'User\WebController@ActiveUser');
    //profile routes:
        //IDE : 
        Route::get('/test-code', 'User\WebController@test_code');
        //profile tab
        Route::get('/profile', 'User\ProfileController@Profile');
        Route::put('/profile/updateinfo', 'User\ProfileController@UpdateInfo');
        Route::put('/profile/update_image', 'User\ProfileController@UserImage');
        //progress tab
        Route::get('/profile/user_courses', 'User\ProfileController@UserCourses');
        Route::delete('/profile/delete_course/{cid}/{id}','User\ProfileController@DelCourse');
        Route::get('/profile/user_lessons/{cid}', 'User\ProfileController@UserLessons');
        Route::get('/course/details/{cid}', 'User\ProfileController@CourseDetails');
        //academic tab
        Route::get('/profile/user_tracks', 'User\ProfileController@UserTracks');
        Route::delete('/profile/delete_track/{tid}/{id}','User\ProfileController@DelTrack');
        //posts tab
        Route::get('/profile/user_posts','User\ProfileController@UserPosts');
        Route::delete('/profile/delete_post/{id}','User\ProfileController@PostDelete');
        //watch later tab
        Route::get('/profile/watch_later','User\ProfileController@GetWatch');
        Route::delete('/profile/delete_watch/{wid}','User\ProfileController@DelWatch');
        //exam tab
        Route::get('/profile/my_exams','User\ProfileController@MyExams');
        Route::delete('/profile/delete_exams/{id}','User\ProfileController@ExamDelete');
        //achivment tab:
        Route::get('/profile/user_achivment', 'User\ProfileController@MyAchivments');
        Route::get('/profile/user_track_achivment', 'User\ProfileController@MyTrackAchivments');
        //suggest course
        Route::post('/profile/suggest_course', 'User\ProfileController@SuggestCourse');
        Route::get('/profile/my_suggestions', 'User\ProfileController@MySuggestions');
        Route::delete('/profile/delete_suggest/{sid}', 'User\ProfileController@DelSuggest');
        Route::get('/profile/achiv/{aid}', 'User\ProfileController@PrintAchiv');
    //end profile routes ///////////////////////////////////////////////////////////////////////////

    //Browse Routes :
        //courses part
        Route::get('/courses', 'User\BrowseController@Courses'); //return all courses
        Route::get('/course-details/{cid}', 'User\BrowseController@CourseDetails'); //return specific course
        Route::get('/course-lessons/{cid}', 'User\BrowseController@CourseLessons');//return specific course
        Route::get('/course-includes/{cid}','User\BrowseController@CourseIncludes');//return the what is the course includes
        Route::get('/enrolled-courses/{tid}/profileID/{pid}','User\BrowseController@EnrolledCourses');//return all courses ID that user take it
        Route::post('/enroll-course/{cid}/profileID/{pid}', 'User\BrowseController@EnrollCourse');
        //lessons part    
        Route::get('/course/{cid}/lessons', 'User\BrowseController@Lessons');//get all lessons for specific course
        Route::get('/course/{cid}/lesson/{lid}', 'User\BrowseController@ViewLesson');//get specific lesson
        Route::post('/add-lesson/{lid}/courseID/{cid}/trackID/{tid}/profileID/{pid}','User\BrowseController@AddLesson');//add new lesson to user
        Route::post('/course/watch-later/{lid}/profile_id/{pid}', 'User\BrowseController@WatchLater');//add lesson to watch later
    //end courses and lessons///////////////////////////////////////////////////////////////////////

    //academic routes:
        //1st page (tracks:'tracks,enrolled,enroll'):
        Route::get('/academic/tracks', 'User\AcademicController@Tracks');//return all tracks
        Route::get('/academic/enrolled-tracks', 'User\AcademicController@EnrolledTracks');//return all tracks ID that user take it
        Route::post('/academic/enroll-track/{tid}/profileID/{pid}', 'User\AcademicController@EnrollTrack');//add new trak to user
        //2nd page (TrackCourses)
        Route::get('/academic/track-courses/{tid}', 'User\AcademicController@TrackCourses');//return all courses of specific track
        //end academic routes part//////////////////////////////////////////////////////////////////////
        
    //exam routes:
        Route::get('/academic/track/{tid}/course/{cid}/exam/{eid}', 'User\ExamController@AcademicShowExam');
        Route::get('/exams', 'User\ExamController@exams');
        Route::get('/exam/{eid}/course/{cid}', 'User\ExamController@showexam');
        Route::get('/exam/showresult/{pid}', 'User\ExamController@showresult');
    //end exam/////////////////////////////////////////////////////////////////////////////////////    

    //Community routes:
        Route::get('/community/articles', 'User\CommunityController@Articles');//get all articles
        Route::get('/articles/{tid}', 'User\CommunityController@TrackArticles');
        Route::post('/community/post-article', 'User\CommunityController@PostArticle');
        Route::get('/community/article-details/{aid}','User\CommunityController@ArticleDetails');
        Route::get('/community/article-comments/{aid}', 'User\CommunityController@ArticleComments');
        Route::post('/community/add-comment/article/{aid}', 'User\CommunityController@AddComment');
        Route::post('/community/add-reply/comment/{cid}', 'User\CommunityController@CommentReplies');
    // end community routes
    });
// end user routes


// admin routes
    Route::group(['prefix' => 'manage', 'middleware' => ['auth', 'verified']], function () {

        Route::get('/show-users', 'Admin\AdminController@users');
        Route::post('/users', 'Admin\AdminController@AddUsers');
        Route::put('/users/{id}', 'Admin\AdminController@UpdateUsers');
        Route::delete('/users/{id}', 'Admin\AdminController@DeleteUsers');

        Route::get('/show-profiles', 'Admin\AdminController@profiles');
        Route::post('/profiles', 'Admin\AdminController@AddProfiles');
        Route::put('/profiles/{id}', 'Admin\AdminController@UpdateProfiles');
        Route::delete('/profiles/{id}', 'Admin\AdminController@DeleteProfiles');

        Route::get('/show-tracks', 'Admin\AdminController@tracks');
        Route::post('/tracks', 'Admin\AdminController@AddTracks');
        Route::put('/tracks/{id}', 'Admin\AdminController@UpdaTetracks');
        Route::delete('/tracks/{id}', 'Admin\AdminController@DeleteTracks');

        Route::get('/show-courses', 'Admin\AdminController@courses');
        Route::post('/courses', 'Admin\AdminController@AddCourses');
        Route::put('/courses/{id}', 'Admin\AdminController@UpdateCourses');
        Route::delete('/courses/{id}', 'Admin\AdminController@DeleteCourses');
        
        Route::get('/show-lessons', 'Admin\AdminController@Lessons');
        Route::post('/lessons', 'Admin\AdminController@AddLessons');
        Route::put('/lessons/{id}', 'Admin\AdminController@UpdateLessons');
        Route::delete('/lessons/{id}', 'Admin\AdminController@DeleteLessons');
        
        Route::get('/show-exams', 'Admin\AdminController@Exams');
        Route::post('/exams', 'Admin\AdminController@AddExams');
        Route::put('/exams/{id}', 'Admin\AdminController@UpdateExams');
        Route::delete('/exams/{id}', 'Admin\AdminController@DeleteExams');

        Route::get('/show-questions', 'Admin\AdminController@questions');
        Route::post('/questions', 'Admin\AdminController@AddQuestions');
        Route::put('/questions/{id}', 'Admin\AdminController@UpdateQuestions');
        Route::delete('/questions/{id}', 'Admin\AdminController@DeleteQuestions');

        Route::get('/show-articles', 'Admin\AdminController@articles');
        Route::post('/articles', 'Admin\AdminController@AddArticles');
        Route::put('/articles/{id}', 'Admin\AdminController@UpdateArticles');
        Route::delete('/articles/{id}', 'Admin\AdminController@DeleteArticles');

        Route::get('/show-comments', 'Admin\AdminController@comments');
        Route::post('/comments', 'Admin\AdminController@AddComments');
        Route::put('/comments/{id}', 'Admin\AdminController@UpdateComments');
        Route::delete('/comments/{id}', 'Admin\AdminController@DeleteComments');

        Route::get('/show-replies', 'Admin\AdminController@replies');
        Route::post('/replies', 'Admin\AdminController@AddReplies');
        Route::put('/replies/{id}', 'Admin\AdminController@UpdateReplies');
        Route::delete('/replies/{id}', 'Admin\AdminController@DeleteReplies');

        Route::get('/show-achivments', 'Admin\AdminController@achivments');
        Route::post('/course_achivments', 'Admin\AdminController@AddCourseAchivments');
        Route::put('/course_achivments/{id}', 'Admin\AdminController@UpdateCourseAchivments');
        Route::delete('/course_achivments/{id}', 'Admin\AdminController@DeleteCourseAchivments');

        Route::get('/show-details', 'Admin\AdminController@details');
        Route::post('/course_details', 'Admin\AdminController@AddCourseDetails');
        Route::put('/course_details/{id}', 'Admin\AdminController@UpdateCourseDetails');
        Route::delete('/course_details/{id}', 'Admin\AdminController@DeleteCourseDetails');

        Route::get('/show-track_achivments', 'Admin\AdminController@TrackAchivments');
        Route::post('/track_achivments', 'Admin\AdminController@AddTrackAchivments');
        Route::put('/track_achivments/{id}', 'Admin\AdminController@UpdateTrackAchivments');
        Route::delete('/track_achivments/{id}', 'Admin\AdminController@DeleteTrackAchivments');

        Route::get('/show-suggestions', 'Admin\AdminController@suggestions');
        Route::post('/suggestions', 'Admin\AdminController@AddSuggestions');
        Route::put('/suggestions/{id}', 'Admin\AdminController@UpdateSuggestions');
        Route::delete('/suggestions/{id}', 'Admin\AdminController@DeleteSuggestions');

        Route::get('/show-watchs', 'Admin\AdminController@watchs');
        Route::post('/watchs', 'Admin\AdminController@AddWatchs');
        Route::put('/watchs/{id}', 'Admin\AdminController@UpdateWatchs');
        Route::delete('/watchs/{id}', 'Admin\AdminController@DeleteWatchs');

        Route::get('/show-user_profiles', 'Admin\AdminController@UserProfiles');
        Route::post('/user_profiles', 'Admin\AdminController@AddUserProfiles');
        Route::put('/user_profiles/{id}', 'Admin\AdminController@UpdateUserProfiles');
        Route::delete('/user_profiles/{id}', 'Admin\AdminController@DeleteUserProfiles');

        Route::get('/show-user_tracks', 'Admin\AdminController@UserTracks');
        Route::post('/user_tracks', 'Admin\AdminController@AddUserTracks');
        Route::put('/user_tracks/{id}', 'Admin\AdminController@UpdateUserTracks');
        Route::delete('/user_tracks/{id}', 'Admin\AdminController@DeleteUserTracks');

        Route::get('/show-user_courses', 'Admin\AdminController@UserCourses');
        Route::post('/user_courses', 'Admin\AdminController@AddUserCourses');
        Route::put('/user_courses/{id}', 'Admin\AdminController@UpdateUserCourses');
        Route::delete('/user_courses/{id}', 'Admin\AdminController@DeleteUserCourses');

        Route::get('/show-user_lessons', 'Admin\AdminController@UserLessons');
        Route::post('/user_lessons', 'Admin\AdminController@AddUserLessons');
        Route::put('/user_lessons/{id}', 'Admin\AdminController@UpdateUserLessons');
        Route::delete('/user_lessons/{id}', 'Admin\AdminController@DeleteUserLessons');

        Route::get('/show-user_exams', 'Admin\AdminController@UserExams');
        Route::post('/user_exams', 'Admin\AdminController@AddUserExams');
        Route::put('/user_exams/{id}', 'Admin\AdminController@UpdateUserExams');
        Route::delete('/user_exams/{id}', 'Admin\AdminController@DeleteUserExams');

        Route::get('/show-user_course_achivments', 'Admin\AdminController@UserCourseAchivments');
        Route::post('/user_course_achivments', 'Admin\AdminController@AddUserCourseAchivments');
        Route::put('/user_course_achivments/{id}', 'Admin\AdminController@UpdateUserCourseAchivments');
        Route::delete('/user_course_achivments/{id}', 'Admin\AdminController@DeleteUserCourseAchivments');

        Route::get('/show-user_track_achivments', 'Admin\AdminController@UserTrackAchivments');
        Route::post('/user_track_achivments', 'Admin\AdminController@AddUserTrackAchivments');
        Route::put('/user_track_achivments/{id}', 'Admin\AdminController@UpdateUserTrackAchivments');
        Route::delete('/user_track_achivments/{id}', 'Admin\AdminController@DeleteUserTrackAchivments');
            
    });

// end admin routes

Route::get('{path}', 'HomeController@index')->where('path','([A-z\d-\/_.]+)?');