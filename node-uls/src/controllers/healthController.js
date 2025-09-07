/**
 * Health check controller for monitoring application status
 */

/**
 * Get application health status
 */
const getHealth = (req, res) => {
  const healthInfo = {
    status: 'UP',
    timestamp: new Date(),
    uptime: process.uptime(),
    environment: process.env.NODE_ENV || 'development',
    memory: process.memoryUsage(),
  };

  res.json(healthInfo);
};

module.exports = {
  getHealth,
};
