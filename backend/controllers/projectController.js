const Project = require('../models/Project');

const createProject = async (req, res) => {
  const { projectname, period, stack, role, field, explain, explainmore } = req.body;

  try {
    const project = await Project.create({ projectname, period, stack, role, field, explain, explainmore });

    res.status(201).json({ message: 'Project created successfully', project });
  } catch (err) {
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

const getProjects = async (req, res) => {
  try {
    const projects = await Project.getAll();

    res.status(200).json(projects);
  } catch (err) {
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

module.exports = { createProject, getProjects };
