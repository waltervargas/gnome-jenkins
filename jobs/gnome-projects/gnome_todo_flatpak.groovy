def project = [
  name: "gnome-todo-flatpak-builder",
  git_url: "https://github.com/albfan/gnome-todo"
]

multibranchPipelineJob(project.name) {
  branchSources {
    git {
      remote(project.git_url)
    }
  }
}
