# Spark

An social app that models your relationships one world at a time. What if you could build healthier relationship by receiving direct feedback? That's what Spark is for. You can add friends, family, and loved ones - and watch your world grow together.

Stack:
 - Swift
 - UIkit
 - Storyboards
 - Firebase
 - Node.js cloud functions
 - Scenekit

Challenges:
- Building a system for generating a dynamic world was and is difficult. I had to consider that a world would not be the same for any relationship so generating assets randomly on any given terrain proved to challenging. It was ultimately solved by bisecting a plane a certain amount, and using the vector crossections to determine spawn points.

Future Improvements:
- I hope to move away from a system using set vector points, and instead use some form of interpolation to determine where an object should spawn.
- Add more models like flowers, bushes, animals
- Add a pathing AI to allow animals to roam the world
- Add user based actions that will influence the world
