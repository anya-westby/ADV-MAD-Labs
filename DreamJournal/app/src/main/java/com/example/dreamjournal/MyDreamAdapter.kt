package com.example.dreamjournal
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.dreamjournal.model.DreamViewModel
import com.google.android.material.snackbar.Snackbar

class MyDreamAdapter(private val dreamViewModel: DreamViewModel) : RecyclerView.Adapter<MyDreamAdapter.ViewHolder>(){

    private var myDreamList = dreamViewModel.dreamList.value

    class ViewHolder(view: View): RecyclerView.ViewHolder(view) {
        val dreamTextBox: TextView = view.findViewById(R.id.textBox)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val dreamViewHolder = layoutInflater.inflate(R.layout.dream_item, parent, false)
        return ViewHolder(dreamViewHolder)
    }
    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val dream = myDreamList?.get(position)
        holder.dreamTextBox.text = dream?.name ?: ""
        holder.itemView.setOnCreateContextMenuListener(){menu, view, menuInfo ->
            menu.setHeaderTitle(R.string.delete)
            menu.add(R.string.yes).setOnMenuItemClickListener {
                dreamViewModel.delete(dream!!)
                Snackbar.make(view, R.string.deleteItem, Snackbar.LENGTH_LONG)
                    .setAction(R.string.action, null).show()
                true
            }
            menu.add(R.string.no)
        }
    }

    override fun getItemCount(): Int {
        if (myDreamList != null){
            return myDreamList!!.size
        } else return 0
    }

    fun update(){
        myDreamList = dreamViewModel.dreamList.value
        notifyDataSetChanged()
    }
}