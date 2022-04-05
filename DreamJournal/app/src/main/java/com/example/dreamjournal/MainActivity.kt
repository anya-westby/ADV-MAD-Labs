package com.example.dreamjournal

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.EditText
import androidx.activity.viewModels
import androidx.appcompat.app.AlertDialog
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.dreamjournal.model.Dream
import com.example.dreamjournal.model.DreamViewModel
import com.google.android.material.floatingactionbutton.FloatingActionButton
import com.google.android.material.snackbar.Snackbar
import java.util.*

class MainActivity : AppCompatActivity() {

    private val viewModel: DreamViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        //setSupportActionBar(findViewById(R.id.toolbar))
        val recyclerView: RecyclerView = findViewById(R.id.recyclerView)
        recyclerView.addItemDecoration(DividerItemDecoration(this, LinearLayoutManager.VERTICAL))
        recyclerView.layoutManager = LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false)
        val adapter = MyDreamAdapter(viewModel)
        recyclerView.adapter = adapter

        findViewById<FloatingActionButton>(R.id.floatingActionButton).setOnClickListener { view ->
            val dialog = AlertDialog.Builder(this)
            val editText = EditText(applicationContext)
            dialog.setView(editText)
            dialog.setTitle(R.string.addItem)

            dialog.setPositiveButton(R.string.add) {dialog, which ->
                val newItem = editText.text.toString()
                if (!newItem.isEmpty()){
                    val newID = UUID.randomUUID().toString();
                    //add item
                    viewModel.add(Dream(newID, newItem))
                    Snackbar.make(view, R.string.itemAdded, Snackbar.LENGTH_LONG)
                        .setAction(R.string.action, null).show()
                }
            }
            dialog.setNegativeButton(R.string.cancel) { dialog, which ->
            }
            dialog.show()
        }

        viewModel.dreamList.observe(this, Observer{
            adapter.update()
        })
    }
}