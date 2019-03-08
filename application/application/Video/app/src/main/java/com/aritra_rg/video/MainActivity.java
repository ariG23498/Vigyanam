package com.aritra_rg.video;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.MediaController;
import android.widget.VideoView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        VideoView vid = (VideoView) findViewById(R.id.videoView);

        vid.setVideoPath("android.resource://"+getPackageName()+"/"+R.raw.jelly);

        MediaController mediaController = new MediaController(this);

        //first set the anchor
        mediaController.setAnchorView(vid);

        //then give access
        vid.setMediaController(mediaController);

        vid.start();


    }
}
