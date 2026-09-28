use bevy::prelude::*;

/////////////////
//  Resources  //
/////////////////

#[derive(Resource)]
struct GreetTimer(Timer);

//////////////////
//  Components  //
//////////////////

#[derive(Component)]
struct Person;

#[derive(Component)]
struct Name(String);

///////////////
//  Plugins  //
///////////////

pub struct HelloPlugin;

impl Plugin for HelloPlugin {
    fn build(&self, app: &mut App) {
        app.insert_resource(GreetTimer(Timer::from_seconds(2.0, TimerMode::Repeating)));
        app.add_systems(Startup, add_people);
        app.add_systems(Update, (change_people, greet_people).chain());
    }
}

///////////////
//  Systems  //
///////////////

fn add_people(mut commands: Commands) {
    commands.spawn((Person, Name("Alice".to_string())));
    commands.spawn((Person, Name("George".to_string())));
    commands.spawn((Person, Name("Olivia".to_string())));
}

fn greet_people(time: Res<Time>, mut timer: ResMut<GreetTimer>, query: Query<&Name, With<Person>>) {
    if timer.0.tick(time.delta()).just_finished() {
        for name in &query {
            println!("hello {}", name.0);
        }
    }
}

fn change_people(mut query: Query<&mut Name, With<Person>>) {
    for mut name in &mut query {
        if name.0 == "Olivia" {
            name.0 = "Not Olivia".to_string();
            break;
        }
    }
}


fn main() {
    App::new()
        .add_plugins(DefaultPlugins)
        .add_plugins(HelloPlugin)
        .run();
}

