<?php
namespace App\Http\Controllers\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;

use App\Article;
use App\Comment;
use App\Reply;

class CommunityController extends Controller
{
    public function Articles()
    {
        return Article::with('users')->orderBy('created_at', 'desc')->get();
    }
    public function TrackArticles($tid)
    {
        return Article::where('track_id', '=', $tid)->with('users')->orderBy('created_at', 'desc')->get();
    }
    public function PostArticle(Request $request)
    {
        $user_id = Auth::user()->id;
        $this->validate($request, [
            'title' => 'required|string|max:50|min:8',
            'body' => 'required|string|min:20',
            'track_id' => 'required'
        ]);

        $article = new Article();
        $article->title = $request->title;
        $article->body = $request->body;
        $article->user_id = $user_id;
        $article->track_id = $request->track_id;
        $article->save();
    }
    public function ArticleDetails($aid)
    {
        return Article::with('users')->findOrFail($aid);
    }

    public function AddComment(Request $request, $aid)
    {
        $user_id = Auth::user()->id;
        $comment = new Comment();
        $comment->comment = $request->comment;
        $comment->user_id = $user_id;
        $comment->article_id = $aid;
        $comment->save();
    }

    // return comments with replies
    public function ArticleComments($aid)
    {
        return Comment::with('users')
            ->with(array('replies' => function ($query) {
                $query->join('users', 'users.id', '=', 'reply.user_id');
            }))
            ->where('article_id', '=', $aid)->get();
    }

    public function CommentReplies(Request $request, $cid)
    {
        $user_id = Auth::user()->id;

        $reply = new Reply();
        $reply->reply = $request->reply;
        $reply->user_id = $user_id;
        $reply->comment_id = $cid;
        $reply->save();
    }
}
