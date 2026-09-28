use bevy::{
  color::palettes::css::WHITE, pbr::wireframe::{Wireframe, WireframeConfig, WireframePlugin}, prelude::* 
};

fn main() {
  App::new()
    .add_plugins((DefaultPlugins, WireframePlugin::default()))
    .insert_resource(WireframeConfig {
      global: true,
      default_color: WHITE.into(),
      ..default()
    })
    .add_systems(Startup, scene.spawn())
    .run();
}

fn scene() -> impl SceneList {
  bsn_list! [
    (
        #Plane
        Mesh3d(asset_value(Plane3d::default().mesh().size(4.0, 4.0).subdivisions(10)))
        MeshMaterial3d::<StandardMaterial>(asset_value(Color::srgb_u8(124, 144, 255)))
        Transform::from_xyz(0.0, 0.5, 0.0)
    ),
    (
        PointLight {
            shadow_maps_enabled: true,
        }
        Transform::from_xyz(4.0, 8.0, 4.0)
    ),
    (
        Camera3d
        template_value(Transform::from_xyz(-2.5, 4.5, 9.0).looking_at(Vec3::ZERO, Vec3::Y))
    )
  ]
}
