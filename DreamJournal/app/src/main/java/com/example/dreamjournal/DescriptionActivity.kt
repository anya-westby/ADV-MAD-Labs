package com.example.dreamjournal

import android.os.Bundle
import android.text.method.ScrollingMovementMethod
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity


class DescriptionActivity: AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.dream_description)

        val memo: TextView = findViewById(R.id.memoTextView)
        //allow scrollable text view
        memo.movementMethod = ScrollingMovementMethod()
        getNewIntent()
    }

    //intent to get date + memo to display
    private fun getNewIntent() {
        if (intent.hasExtra("dateDescription") && intent.hasExtra("memoDescription")) {
            val dateDescription = intent.getStringExtra("dateDescription")
            val memoDescription = intent.getStringExtra("memoDescription")

            setDescription(dateDescription, memoDescription)
        }
    }

    //sets info for my dream_description layout
    private fun setDescription(date_description: String?, memo_description: String?){
        val date: TextView = findViewById(R.id.dateTextView)
        date.text = date_description
        val memo: TextView = findViewById(R.id.memoTextView)
        memo.text = memo_description
    }

}