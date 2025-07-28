import express from 'express';
import { getTasks, createTask } from '../controllers/taskController.js';
import { authenticate } from '../middleware/authMiddleware.js';

const router = express.Router();
router.use(authenticate);

router.get('/', getTasks);
router.post('/', createTask);

export default router;
