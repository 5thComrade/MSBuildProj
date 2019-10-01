using System;

namespace Payroll.TEAMLEASE.Logging
{
    /// <summary>
    /// Interface to define the Logger component
    /// </summary>
    public interface ILogger
    {
        /// <summary>
        /// Method to log information messages
        /// </summary>
        /// <param name="message"></param>
        /// <param name="list"></param>
        void LogInfo(Exception ex, string method);
    }

}
