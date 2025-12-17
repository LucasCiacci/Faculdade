@extends('layouts.app')
@section('content')
<div class="container">
<h1>Edit Post</h1>
<form action="{{ route('posts.update', $post) }}" method="POST">
@csrf
@method('PUT')
<div class="form-group">
<label for="title">Title</label>
<input type="text" name="title" class="form-control" id="title" value="{{ $post->title }}" required>
</div>
<div class="form-group">
<label for="content">Content</label>
<textarea name="content" class="form-control" id="content" rows="5" required>{{ $post->content }}</textarea>
</div>
<button type="submit" class="btn btn-primary">Update</button>
</form>
</div>
@endsection