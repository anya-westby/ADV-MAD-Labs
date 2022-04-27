package com.example.dreamjournal


import android.app.DatePickerDialog
import android.os.Bundle
import android.widget.EditText
import android.widget.LinearLayout
import androidx.activity.viewModels
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
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
    private var dreamAdapter: MyDreamAdapter? = null
    private val months = arrayOf("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val recyclerView: RecyclerView = findViewById(R.id.recyclerView)
        recyclerView.addItemDecoration(DividerItemDecoration(this, LinearLayoutManager.VERTICAL))
        recyclerView.layoutManager = LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false)

        val options = viewModel.options
        dreamAdapter = MyDreamAdapter(options, viewModel)
        recyclerView.adapter = dreamAdapter


        findViewById<FloatingActionButton>(R.id.floatingActionButton).setOnClickListener{ view ->
            val layout = LinearLayout(this)
            layout.orientation = LinearLayout.VERTICAL


            val dateEditText = EditText(this)
            dateEditText.setHint(R.string.dateHint)
            layout.addView(dateEditText)
            dateEditText.isClickable = true

            //calendar popup
            dateEditText.setOnClickListener {
                val cal = Calendar.getInstance()
                val day = cal[Calendar.DAY_OF_MONTH]
                val month = cal[Calendar.MONTH]
                val year = cal[Calendar.YEAR]
                // date picker dialog
                val picker = DatePickerDialog(
                    this@MainActivity,
                    { view, year, monthOfYear, dayOfMonth -> dateEditText.setText(months[monthOfYear] + " " + dayOfMonth + ", " + year) },
                    year,
                    month,
                    day
                )
                picker.show()
            }

            val memoEditText = EditText(this)
            memoEditText.setHint(R.string.dreamHint)
            layout.addView(memoEditText)

            val dialog = AlertDialog.Builder(this)
            dialog.setTitle(R.string.addDream)
            dialog.setView(layout)

            dialog.setPositiveButton(R.string.add){ dialog, which ->
                val dreamDate = dateEditText.text.toString()
                val dreamMemo = memoEditText.text.toString()

                if(dreamDate.isNotEmpty()){
                    val newDream = Dream(dreamDate, dreamMemo)
                    viewModel.addDream(newDream)
                    Snackbar.make(view, R.string.dreamAdded, Snackbar.LENGTH_LONG)
                        .setAction(R.string.action, null).show()
                }
            }
            dialog.setNegativeButton(R.string.cancel){ dialog, which ->
            }
            dialog.show()
        }
    }


    override fun onStart(){
        super.onStart()
        dreamAdapter?.startListening()
    }

    override fun onStop(){
        super.onStop()
        dreamAdapter?.stopListening()
    }
}
