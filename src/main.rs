use bevy::{
  asset::uuid::Version::Custom, color::palettes::css::WHITE, pbr::wireframe::{Wireframe, WireframeConfig, WireframePlugin}, prelude::*, reflect::TypePath, render::render_resource::AsBindGroup, shader::ShaderRef
};

const SHADER_PATH: &str = "shaders/fbm.wgsl";

fn main() {
  App::new()
    .add_plugins((DefaultPlugins, WireframePlugin::default(), MaterialPlugin::<CustomMaterial>::default()))
    .insert_resource(WireframeConfig {
      global: true,
      default_color: WHITE.into(),
      ..default()
    })
    .add_systems(Startup, setup)
    .run();
}

fn setup(
  mut commands: Commands,
  mut meshes: ResMut<Assets<Mesh>>,
  mut materials: ResMut<Assets<CustomMaterial>>
) {
  commands.spawn((
        Mesh3d(meshes.add(Plane3d::default().mesh().size(4.0, 4.0).subdivisions(10))),
        MeshMaterial3d(materials.add(CustomMaterial {})),
        Transform::from_xyz(0.0, 0.5, 0.0)
  ));

  commands.spawn((
    Camera3d::default(),
    Transform::from_xyz(-2.5, 2.5, 9.0).looking_at(Vec3::ZERO, Vec3::Y),
  ));
}

#[derive(Asset, TypePath, AsBindGroup, Debug, Clone)]
struct CustomMaterial {}

impl Material for CustomMaterial {
  fn vertex_shader() -> ShaderRef {
      SHADER_PATH.into()
  }

  fn fragment_shader() -> ShaderRef {
      SHADER_PATH.into()
  }
} 
