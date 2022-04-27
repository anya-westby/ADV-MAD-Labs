package com.example.dreamjournal


import android.content.Intent
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.dreamjournal.model.Dream
import com.example.dreamjournal.model.DreamViewModel
import com.firebase.ui.firestore.FirestoreRecyclerAdapter
import com.firebase.ui.firestore.FirestoreRecyclerOptions
import com.google.android.material.snackbar.Snackbar
import com.google.firebase.firestore.ktx.toObject


class MyDreamAdapter(options: FirestoreRecyclerOptions<Dream>, private val viewModel: DreamViewModel): FirestoreRecyclerAdapter<Dream, MyDreamAdapter.ViewHolder>(options){

    class ViewHolder(view: View): RecyclerView.ViewHolder(view) {
        val dreamTextView: TextView = view.findViewById(R.id.textBox)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder{
        val layoutInflater = LayoutInflater.from(parent.context)
        val dreamViewHolder = layoutInflater.inflate(R.layout.dream_item, parent, false)
        return ViewHolder(dreamViewHolder)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int, model: Dream){
        holder.dreamTextView.text = model.date

        holder.itemView.setOnCreateContextMenuListener { menu, view, menuInfo ->
            menu.setHeaderTitle(R.string.delete)
            menu.add(R.string.yes).setOnMenuItemClickListener {
                val id = snapshots.getSnapshot(position).id
                viewModel.deleteDream(id)
                Snackbar.make(view, R.string.deleteDream, Snackbar.LENGTH_LONG)
                    .setAction(R.string.action, null).show()
                true
            }
            menu.add(R.string.no)
        }

        holder.itemView.setOnClickListener{view ->
            val documentSnapshot = snapshots.getSnapshot(position)
            val dreamMemo = documentSnapshot.toObject<Dream>()?.memo
            val context = view.context

            val intent = Intent(context, DescriptionActivity::class.java)
            intent.putExtra("dateDescription", model.date)
            intent.putExtra("memoDescription", dreamMemo)

            context.startActivity(intent)

        }
    }
}