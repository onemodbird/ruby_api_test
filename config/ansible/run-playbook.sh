if [ ! -f "${BASH_SOURCE%/*}/variables.local.yml" ]; then
    echo "Copy 'variables.local.yml.template' to variables.local.yml and complete!"
    exit
fi

roles_installed=true
for role in `awk '{ print $3 }' config/ansible/requirements.yml`; do
  # Ideally, we would check the return value of ansible-galaxy and avoid the
  # grep, but it returns success regardless of whether or not the role is found
  if ansible-galaxy list "$role" | grep 'not found'; then
    roles_installed=false
  fi
done

if ! $roles_installed; then
  ansible-galaxy install -r config/ansible/requirements.yml --ignore-errors
fi

ansible-playbook config/ansible/playbook.yml -i config/ansible/inventory.ini "$@"

