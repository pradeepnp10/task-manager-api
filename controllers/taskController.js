import pool from '../config/db.js';

export const getTasks = async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM tasks WHERE user_id = $1', [req.userId]);
    res.json(result.rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

export const createTask = async (req, res) => {
  const { title } = req.body;
  try {
    const result = await pool.query('INSERT INTO tasks (title, user_id) VALUES ($1, $2) RETURNING *', [title, req.userId]);
    res.status(201).json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
