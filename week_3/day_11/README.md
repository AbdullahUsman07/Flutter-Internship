# Day 11 - ToDo App  

This is a **modern ToDo application** built with Flutter. The app allows users to manage their tasks by categorizing them into **Today's Tasks, Upcoming Tasks, and Completed Tasks**.  

---

## 📌 Features  
- Add new tasks with **title, description, and due date**  
- Tasks are organized into three categories:
  - ✅ Today's Tasks  
  - ⏳ Upcoming Tasks  
  - 🗂 Completed Tasks  
- Mark tasks as completed or pending  
- Dialog confirmation after adding a task  
- **Modern UI** with a clean, professional look  

---

## ⚙️ State Management  
This app uses **GetX** for state management:  
- `TaskController` manages the task list and provides helper methods.  
- Reactive updates with `Obx` and controller methods.  
- Lightweight and simple compared to Provider or Bloc.  

---

## 🎨 UI Design  
The UI was kept **modern and minimalistic**, focusing on:  
- Simple color scheme with emphasis on readability  
- Clear hierarchy between **headings (24–28)**, **subheadings (18)**, and **task items (14–16)**  
- Floating action button for quick task addition  

---

## 🖼️ Screenshots  

<p align="center">
  <img src="../screenshots/landing.jpeg" alt="Landing Screen" width="150"/>
  <img src="../screenshots/login.jpeg" alt="Login Screen" width="150"/>
  <img src="../screenshots/signup_new.jpeg" alt="Signup Screen" width="150"/>
  <img src="../screenshots/tasks_new.jpeg" alt="Task Screen" width="150"/>
  <img src="../screenshots/drawer.jpeg" alt="Drawer Screen" width="150"/>
  <img src="../screenshots/taskdetail.jpeg" alt="Task Detail Screen" width="150"/>
  <img src="../screenshots/addtask_new.jpeg" alt="Add Task Screen" width="150"/>
</p>  

---

## 🔮 Future Work  
For the future, the app will be extended with **Firebase integration** to make it a complete **CRUD app** with:  
- User authentication  
- Persistent storage of tasks  
- Real-time sync across devices  

---
